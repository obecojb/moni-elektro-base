[[Moni's Elektro Base|← Zurück zur Homepage]]

# Console Login - HAPROXMOX

## Übersicht

Zugang zur [[Funktionen und Geräte/Hardware/Hypervisor PVE|Proxmox-Konsole]] für direkte Systemverwaltung der [[Funktionen und Geräte/Software/Home Assistant|Home Assistant]]-VM und des Hypervisors.

---

## Schritt-für-Schritt Anleitung

### 1. Proxmox-Webinterface öffnen
```
https://192.168.2.146:8006/
```
Oder: `pve.local:8006` (falls DNS konfiguriert)

### 2. Mit Proxmox anmelden
- **Benutzer**: root@pam (oder konfigurierter User)
- **Passwort**: [Proxmox-Passwort]
- **Realm**: Proxmox PAM oder LDAP

### 3. VM / Node wählen
Im linken Menü:
- **Für HAOS-VM**: Datencenter → Node (pve) → Virtual Machines → Home Assistant
- **Für Proxmox-Host**: Datencenter → Node (pve)

### 4. Konsole öffnen
Rechts oben: **Console** oder **Konsole** Reiter klicken
- Öffnet sich in neuem Tab (VNC oder Spice)

### 5. Home Assistant anmelden
Nach Konsolenstart erscheint Login-Prompt:
```
Home Assistant Command Line Interface
login: root
Password: [HA-Passwort]
```

---

## Keyboard-Shortcuts in der Konsole

| Shortcut | Funktion |
|---|---|
| `Ctrl + Alt + F1` | Zu TTY1 wechseln |
| `Ctrl + Alt + F2` | Zu TTY2 wechseln |
| `Ctrl + Alt + Del` | System neu starten |
| `Ctrl + C` | Laufende Befehle abbrechen |
| `Ctrl + L` | Bildschirm löschen |

---

## Nützliche Home Assistant Befehle

```bash
# Status prüfen
systemctl status home-assistant@root

# Logs anzeigen
journalctl -u home-assistant@root -n 100 -f

# Home Assistant neu starten
systemctl restart home-assistant@root

# Zugriff auf config.yaml
nano /root/.homeassistant/configuration.yaml

# Netzwerk-Status
ip a show
ping google.com
```

---

## Proxmox Host Console

Für direkten Zugriff auf Proxmox-Host (nicht HAOS):

1. Im Proxmox-Webinterface: **Node (pve)** auswählen
2. **Console** klicken
3. Proxmox-Prompt: `root@pve:~#`

Hier sind Proxmox-Befehle verfügbar:
```bash
# VM-Status
qm list

# Netzwerk-Konfiguration
cat /etc/network/interfaces

# Storage prüfen
pvesm list

# System-Monitoring
top
```

---

## Sicherheitshinweise

⚠️ **Wichtig:**
- Root-Zugang hat **volle Systemrechte** – vorsichtig verwenden!
- Befehle in der Konsole sind **nicht protokolliert** (im Gegensatz zur Webinterface)
- **Niemals** zufällig Befehle ausführen, besonders nicht mit `rm -rf` oder `dd`
- SSH-Schlüssel nutzen statt Passwort für bessere Sicherheit

---

## Troubleshooting

| Problem | Lösung |
|---|---|
| Konsole aktualisiert nicht | Browser Cache löschen oder neuen Tab öffnen |
| Eingaben funktionieren nicht | Mit Maus ins Konsolen-Fenster klicken (Focus) |
| Schwarzer Bildschirm | Enter drücken, mehrmals Tab versuchen |
| Home Assistant reagiert nicht | `systemctl restart home-assistant@root` ausführen |
| VNC lädt nicht | Java-Applet Browser-Anforderung überprüfen |

---

## Verbundene Systeme

- [[Funktionen und Geräte/Hardware/Hypervisor PVE|Hypervisor Proxmox PVE]]
- [[Funktionen und Geräte/Software/Home Assistant|Home Assistant]]
- [[Funktionen und Geräte/Hardware/NAS Synology DSOBE2023|NAS für Backups]]

---

**Status:** In Betrieb
**Letzte Aktualisierung:** 2026-05-22
---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
