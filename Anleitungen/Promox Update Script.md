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

| Eigenschaft | Wert |
|-------------|------|
| Pfad | `/usr/local/sbin/pve-update.sh` |
| Aufruf | `bash /usr/local/sbin/pve-update.sh` |
| Log-Datei | `/var/log/pve-update.log` |
| E-Mail | `joachim.berger@obecosupport.de` |
| HA VM-ID | `100` |

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