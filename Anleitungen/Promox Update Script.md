[[Moni's Elektro Base|← Zurück zur Homepage]]
---
tags:
  - proxmox
  - automation
  - bash
  - homeassistant
  - linux
created: 2026-05-19
---

# pve-update.sh – Proxmox Update Script

## Übersicht

| Eigenschaft | Wert                                 |
| ----------- | ------------------------------------ |
| Pfad        | `/usr/local/sbin/pve-update.sh`      |
| Aufruf      | `bash /usr/local/sbin/pve-update.sh` |
| Log-Datei   | `/var/log/pve-update.log`            |
| E-Mail      | `joachim.berger@obecosupport.de`     |
| HA VM-ID    | `100`                                |

## Beschreibung

Vollständiges Update-Script für Proxmox Host, LXC Container und Home Assistant.
Wird als Cron-Job oder manuell ausgeführt und sendet nach Abschluss einen
E-Mail-Report.

## Ablauf

### 1. Proxmox Host
- Führt `apt-get update` aus
- Führt `apt-get dist-upgrade -y` aus
- Meldet Anzahl der aktualisierten Pakete

### 2. LXC Container (nur laufende)
- Iteriert über alle laufenden Container via `pct list`
- Führt in jedem Container `apt-get update && apt-get upgrade -y` aus

### 3. Home Assistant (VM 100)
- Prüft ob die VM läuft
- Aktualisiert die Komponenten `core`, `os` und `supervisor`
- Verwendet `qm guest exec` + `ha <component> update`

### 4. Report & E-Mail
- Erstellt Zusammenfassung mit Start-/Endzeit und Fehleranzahl
- Speichert Report nach `/tmp/pve-update-report.txt`
- Sendet Report per E-Mail (benötigt `mailutils`)

## Source Code

```bash
#!/bin/bash
# /usr/local/sbin/pve-update.sh
# Proxmox + LXC + Home Assistant vollstaendiges Update-Skript
# Aufruf: bash /usr/local/sbin/pve-update.sh

LOG_FILE="/var/log/pve-update.log"
EMAIL="joachim.berger@obecosupport.de"
HA_VM_ID=100
START_TIME=$(date '+%Y-%m-%d %H:%M:%S')
SUMMARY=()
ERRORS=0

exec > >(tee -a "$LOG_FILE") 2>&1

line()    { printf '%.0s-' {1..60}; echo; }
section() { echo; line; echo "  $1"; line; }
log()     { echo "[$(date '+%H:%M:%S')] $*"; }
ok()      { log "OK  $*"; SUMMARY+=("OK  $*"); }
fail()    { log "ERR $*"; SUMMARY+=("ERR $*"); ((ERRORS++)) || true; }

echo ""
echo "======================================================"
printf "  PVE-Update  %s\n" "$(date '+%Y-%m-%d %H:%M')"
echo "======================================================"

# 1. Proxmox Host
section "1. Proxmox Host (apt dist-upgrade)"
log "apt-get update..."
if apt-get update -qq; then
    UPGRADABLE=$(apt list --upgradable 2>/dev/null | grep -vc "^Listing" || true)
    log "apt-get dist-upgrade ($UPGRADABLE Pakete)..."
    if apt-get dist-upgrade -y; then
        ok "Proxmox Host: $UPGRADABLE Pakete aktualisiert"
    else
        fail "Proxmox Host: dist-upgrade fehlgeschlagen"
    fi
else
    fail "Proxmox Host: apt-get update fehlgeschlagen"
fi

# 2. LXC Container
section "2. LXC Container (laufend)"
while read -r CTID CTSTATUS CTNAME; do
    [ "$CTSTATUS" != "running" ] && continue
    log "Container $CTID ($CTNAME): update..."
    if pct exec "$CTID" -- bash -c "apt-get update -qq && apt-get upgrade -y" 2>&1; then
        ok "LXC $CTID ($CTNAME): aktualisiert"
    else
        fail "LXC $CTID ($CTNAME): Fehler beim Update"
    fi
done < <(pct list | awk 'NR>1 {print $1, $2, $3}')

# 3. Home Assistant
section "3. Home Assistant (VM $HA_VM_ID)"
VM_STATUS=$(qm status "$HA_VM_ID" 2>/dev/null | awk '{print $2}')
if [ "$VM_STATUS" != "running" ]; then
    fail "VM $HA_VM_ID laeuft nicht (Status: ${VM_STATUS:-unbekannt})"
else
    for COMPONENT in core os supervisor; do
        log "HA $COMPONENT: Update-Check..."
        INFO=$(qm guest exec "$HA_VM_ID" -- ha "$COMPONENT" info 2>/dev/null)
        if echo "$INFO" | grep -q 'update_available: true'; then
            log "HA $COMPONENT: Update gefunden, starte Update..."
            if qm guest exec "$HA_VM_ID" -- ha "$COMPONENT" update 2>&1; then
                ok "HA $COMPONENT: aktualisiert"
            else
                fail "HA $COMPONENT: Update fehlgeschlagen"
            fi
        else
            ok "HA $COMPONENT: bereits aktuell"
        fi
    done
fi

# 4. Report
section "4. Zusammenfassung"
END_TIME=$(date '+%Y-%m-%d %H:%M:%S')
{
    printf "PVE-Update Report – %s\n" "$(hostname)"
    printf "Gestartet : %s\n" "$START_TIME"
    printf "Beendet   : %s\n" "$END_TIME"
    printf "Fehler    : %d\n\n" "$ERRORS"
    printf -- "---\n"
    for ENTRY in "${SUMMARY[@]}"; do printf "%s\n" "$ENTRY"; done
    printf "\nLog: %s\n" "$LOG_FILE"
} | tee /tmp/pve-update-report.txt

SUBJECT="[PVE] Update $([ "$ERRORS" -eq 0 ] && echo 'OK' || echo 'FEHLER') – $(date '+%Y-%m-%d')"
if command -v mail &>/dev/null; then
    mail -s "$SUBJECT" "$EMAIL" < /tmp/pve-update-report.txt \
        && log "E-Mail gesendet an $EMAIL" \
        || log "WARNUNG: E-Mail fehlgeschlagen"
else
    log "WARNUNG: 'mail' nicht installiert – kein E-Mail-Versand (apt install mailutils)"
fi

echo ""
[ "$ERRORS" -eq 0 ] \
    && echo ">>> Update erfolgreich abgeschlossen." \
    || echo ">>> Update mit $ERRORS Fehler(n) abgeschlossen – Log: $LOG_FILE"
echo ""
```

---

## Letzter Lauf

| | |
|---|---|
| Datum | 2026-05-19 |
| Start | 10:13:22 |
| Ende | 10:15:01 |
| Fehler | 0 |
| Host-Pakete | 9 aktualisiert |
| LXC 104 (tor-snowflake) | aktualisiert |
| HA core / os / supervisor | bereits aktuell |

## Abhängigkeiten

- `apt` (Debian/Proxmox)
- `pct` (Proxmox LXC CLI)
- `qm` (Proxmox QEMU CLI)
- `mailutils` (für E-Mail-Versand)