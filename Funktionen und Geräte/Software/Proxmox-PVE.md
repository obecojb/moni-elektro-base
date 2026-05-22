[[Moni's Elektro Base|← Zurück zur Homepage]]
## Funktion

Der Proxmox-Server ist eine Open-Source Virtualisierungsplattform, die auf einem [[Hypervisor PVE]] installiert ist. Er dient als zentrale Verwaltungsplattform für alle Dienste des Smart Home Systems.

![[proxmox.webp]]

Hinweise zur Bedienung: [[Console Login]]
## Aufgaben

Der Proxmox-Server führt folgende Aufgaben aus:

- **Home Assistant Betrieb**: Auf einer virtuellen Maschine läuft die zentrale Home Automation. Dort werden alle elektrischen Komponenten und Sensoren verwaltet und gesteuert.
- Die Anbindung der [[Zigbee Daten im HomeAssistant|Zigbee]] Sensoren über ein [[Ziggbee2MQT auf Proxmox|MQTT]] Gateway
- **Tor Snowflake**: Eine weitere VM stellt einen Tor Exit Node bereit und unterstützt damit das Tor-Netzwerk.
- **Serviceüberwachung**: die Verfügbarkeit der Server wird von einer speziellen Anwendung [[Uptime Kuma]] innerhalb der VM von Hoe Assistant überwacht
- **Ressourcen-Verwaltung**: Der Server verwaltet CPU, RAM und Speicherplatz effizient zwischen den einzelnen virtuellen Maschinen.
- **Backup & Wiederherstellung**: Zentrale Verwaltung von VM-Backups für Datensicherung und Notfallfallwiederherstellung.
- **Performance-Überwachung**: Kontinuierliche Kontrolle von Systemressourcen und Zustand aller laufenden Services.

## Hardware

Das System läuft auf einem [[Hypervisor PVE]] mit der notwendigen CPU-, RAM- und Speicherkapazität für stabilen Betrieb mehrerer virtueller Maschinen.

## Integration

Der Proxmox-Server bildet die technische Grundlage für das gesamte Home Assistant Ökosystem und ermöglicht die Konsolidierung mehrerer Dienste auf einer einzigen physikalischen Hardware.

## Update ##

Das Update erfolgt nach Eingang der Updatemeldung vom Hersteller mit [[Proxmox Update Script]].




