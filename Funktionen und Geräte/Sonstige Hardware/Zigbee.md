[[Moni's Elektro Base|← Zurück zur Homepage]]
# Übersicht

## Funktion

Zigbee ist ein drahtloses Kommunikationsprotokoll für die Vernetzung von Smart-Home-Geräten. Es ermöglicht eine zuverlässige, energieeffiziente und sichere Verbindung zwischen Sensoren, Schaltern, Lampen und anderen IoT-Komponenten im Heimautomationssystem.

## Was ist Zigbee?

Zigbee ist ein offener Standard für Mesh-Netzwerke basierend auf IEEE 802.15.4:

- **Frequenz**: 2,4 GHz ISM-Band (weltweit verfügbar)
- **Reichweite**: 10-100 Meter pro Gerät (erweiterbar durch Mesh-Netzwerk)
- **Bandbreite**: 250 kbit/s
- **Topologie**: Mesh-Netzwerk (jedes Gerät kann Signale weiterleiten)
- **Verschlüsselung**: AES-128 Verschlüsselung für Sicherheit

## Mesh-Netzwerk

Zigbee funktioniert als Mesh-Netzwerk, nicht als Stern-Topologie:

- **Router-Funktion**: Jedes Geräte-können Signale von anderen Geräten weitergeleitet
- **Redundanz**: Ausfalls eines Gerätes beeinträchtigt Netzwerk nicht
- **Reichweite-Erweiterung**: Netzwerk wird größer mit jedem neuen Gerät
- **Automatisches Routing**: Signale finden den besten Weg selbst

## Geräte im System

Das Zigbee-Netzwerk in Moni's Elektro Base verbindet:

- **Sensoren**: Temperatur, Luftfeuchtigkeit, Bewegung, Türkontakte
- **Schalter**: Licht-Schalter, Dimmerswitches, intelligente Steckdosen
- **Leuchten**: Farbige LED-Leuchten, dimmbare Lampen
- **Heizung/Klima**: Thermostate, Ventile, Klimaregler
- **Sicherheit**: Rauchmelder, CO2-Melder, Alarmsensoren

## Koordination und Zentrale

Die Zigbee-Zentrale koordiniert alle Geräte:

- **Coordinator**: Ein Hauptgerät (Sonoff Dongle M) fungiert als Zentrale
- **Router**: Intermediäre Geräte leiten Signale weiter
- **End Devices**: Batteriebetriebene Sensoren (niedrig-Energie)
- **Home Assistant Integration**: Alle Zigbee-Geräte werden in [[Home Assistant]] angebunden

## Hardware: Sonoff Dongle M

Das System nutzt den [[Zigbee Sonoff Dongle M]] als Zentrale:

- **USB-Dongle**: Kompakt und einfach zu installieren
- **Reichweite**: Erweitert die Netzwerk-Reichweite erheblich
- **Zuverlässig**: Stabile Verbindung zu allen Geräten
- **Home Assistant Support**: Vollständig unterstützt in HA

## Vorteile von Zigbee

- **Energieeffizient**: Ideal für batteriebetriebene Sensoren (Jahre ohne Batteriewechsel)
- **Zuverlässig**: Mesh-Netzwerk mit automatischem Failover
- **Sicher**: Verschlüsselte Kommunikation
- **Interoperabel**: Viele Hersteller unterstützen den Standard
- **Kostengünstig**: Günstiger als proprietäre Systeme
- **Geringe Latenz**: Schnelle Reaktion auf Befehle

## Integration in Home Assistant

Zigbee-Geräte werden über die [[Ziggbee2MQT auf Proxmox|Zigbee2MQTT]] Integration auf dem Proxmox-Server in Home Assistant eingebunden:

- **Automatische Erkennung**: Neue Geräte werden erkannt und angezeigt
- **Automation**: Szenen und Automatisierungen basierend auf Zigbee-Ereignissen
- **Statusüberwachung**: Echtzeit-Anzeige von Gerätestatus
- **Fernsteuerung**: Kontrolle aller Geräte von überall

---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
