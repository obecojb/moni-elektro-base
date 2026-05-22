[[Moni's Elektro Base|← Zurück zur Homepage]]

# Zigbee2MQTT auf Proxmox

## Übersicht

Zigbee2MQTT wird als **LXC-Container** direkt auf dem [[Funktionen und Geräte/Hardware/Hypervisor PVE|Proxmox-Server]] betrieben. Die Installation erfolgt über ein Community-Script, das den Container automatisch einrichtet.

---

## Installation

### 1. Community-Script ausführen

Im Proxmox-Shell (Node-Ebene) folgenden Befehl ausführen:

```bash
bash -c "$(wget -qLO - https://community-scripts.org/scripts/zigbee2mqtt)"
```

Das Script erstellt automatisch einen LXC-Container mit allen Abhängigkeiten.

📖 **Installations-Anleitung:** [Community Scripts – Zigbee2MQTT](https://community-scripts.org/scripts/zigbee2mqtt?id=zigbee2mqtt)

### 2. Nach der Installation konfigurieren

Nach der Einrichtung des Containers müssen einige Anpassungen vorgenommen werden (USB-Passthrough, MQTT-Broker, Geräte-Konfiguration).

📖 **Konfigurationshinweise:** [ProxmoxVE Community Diskussion](https://github.com/community-scripts/ProxmoxVE/discussions/410)

---

## Zugriff auf den Container

### Webinterface

Nach erfolgreicher Installation ist Zigbee2MQTT über das Webinterface erreichbar:

```
http://192.168.2.176:8080/#/
```

### Konsole (SSH)

Für Troubleshooting und Logs wird die Konsole verwendet:

```bash
# 1. SSH-Verbindung zum Proxmox-Host herstellen
ssh root@192.168.2.146

# 2. In den LXC-Container wechseln (ID 105)
pct enter 

# 3. Zum Zigbee2MQTT-Verzeichnis wechseln
cd /opt/zigbee2mqtt

# 4. Zigbee2MQTT manuell starten (zeigt Fehler direkt an)
npm start
```

---

## Konfiguration

Die Konfigurationsdatei befindet sich im Container unter:

```
/opt/zigbee2mqtt/data/configuration.yaml
```

### Wichtige Einstellungen

Für die Konfiguration des per USB angeschlossenen [[Zigbee Sonoff Dongle M]] wird diese Konfiguration verwendet:

```yaml
# MQTT-Broker Verbindung
mqtt:
  base_topic: zigbee2mqtt
  server: mqtt://192.168.2.x:1883

# Zigbee-Dongle Pfad
serial:
  port: /dev/ttyUSB0

# Webinterface aktivieren
frontend:
  port: 8080

# Logging
advanced:
  log_level: info
```

---

## USB-Passthrough für den Zigbee-Dongle

Der [[Funktionen und Geräte/Sonstige Hardware/Zigbee Sonoff Dongle M|Zigbee-Dongle]] muss dem LXC-Container zugewiesen werden:

### 1. USB-Gerät identifizieren (auf Proxmox-Host)

```bash
lsusb
# Beispiel-Ausgabe: Bus 001 Device 003: ID 1a86:55d4 QinHeng Electronics
```

### 2. Container-Konfiguration anpassen

```bash
nano /etc/pve/lxc/<Container-ID>.conf
```

Folgende Zeilen hinzufügen:

```
lxc.cgroup2.devices.allow: c 188:* rwm
lxc.mount.entry: /dev/ttyUSB0 dev/ttyUSB0 none bind,optional,create=file
```

### 3. Container neu starten

```bash
pct restart <Container-ID>
```

---

## Troubleshooting

| Problem | Lösung |
|---|---|
| Container startet nicht | `pct start <ID>` und Logs prüfen: `pct exec <ID> -- journalctl -xe` |
| Dongle wird nicht erkannt | USB-Passthrough prüfen, `lsusb` im Container ausführen |
| MQTT-Verbindung fehlgeschlagen | Broker-IP und Port in `configuration.yaml` prüfen |
| Webinterface nicht erreichbar | Firewall-Regeln und Port 8080 prüfen |
| Geräte pairen nicht | Zigbee2MQTT Logs prüfen: `npm start` im Vordergrund |
| Hoher CPU-Verbrauch | Log-Level auf `warn` setzen, Geräte-Anzahl prüfen |

---

## Service-Verwaltung

```bash
# Service-Status prüfen
systemctl status zigbee2mqtt

# Service neu starten
systemctl restart zigbee2mqtt

# Logs in Echtzeit verfolgen
journalctl -u zigbee2mqtt -f

# Service stoppen
systemctl stop zigbee2mqtt
```

---

## Verwandte Dokumentation

- [[Zigbee Daten im HomeAssistant|Zigbee-Datenweg zu Home Assistant]]
- [[Funktionen und Geräte/Sonstige Hardware/Zigbee Sonoff Dongle M|Zigbee Sonoff Dongle]]
- [[Funktionen und Geräte/Sonstige Hardware/Zigbee|Zigbee Überblick]]
- [[Funktionen und Geräte/Hardware/Hypervisor PVE|Proxmox PVE]]

---

**Status:** In Einrichtung
**Letzte Aktualisierung:** 2026-05-22
