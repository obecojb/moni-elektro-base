[[Moni's Elektro Base|← Zurück zur Homepage]]

## Beschreibung

Der Sonoff Dongle-M ist ein Ethernet/Wlan/USB-Zigbee-Adapter zur Erstellung eines Zigbee-Netzwerks in der [[Home Assistant]] Zentrale. Er fungiert als Coordinator für das Zigbee Netzwerk und ermöglicht die Kommunikation mit allen Zigbee-Geräten im Haus.

![[Sonnof.webp]]
## Spezifikationen

- **Typ**: Zigbee USB Dongle / Koordinator
- **Protokoll**: Zigbee 3.0
- **Chipsatz**: EFR32MG21 (Silicon Labs)
- **Verbindung**: USB 2.0 / USB-A Anschluss
- **Reichweite**: Bis zu 100m (im freien Feld)
- **Stromversorgung**: Über USB-Bus

## Funktion

- Koordinator für das Zigbee-Netzwerk
- Zentrale Kommunikationsstelle für alle Zigbee-Geräte
- Ermöglicht die Verwaltung von Netzwerk-Topologie und Routing
- Unterstützt bis zu 250+ Zigbee-Geräte im Netzwerk
- Automatische Netzwerk-Bildung und Geräte-Pairing

Die lokale Verwaltung erfolgt per Webseite:
![[ZiggbeeStatus.webp]]

## Integration mit Home Assistant

Der Sonoff Dongle-M wird direkt in Home Assistant integriert:
- Automatische Erkennung über USB / WLAN / Ethernet
- Native ZHA (Zigbee Home Automation) Integration
- Verwaltung aller Zigbee-Geräte über Home Assistant
- Automatisierungen und Szenarien für Zigbee-Geräte
- Echtzeit-Status und Steuerung aller verbundenen Geräte

Im Home Assistant sieht das beispielsweise so aus:
![[ZiggbeHA.webp]]

## Unterstützte Geräte

Der Dongle-M ist kompatibel mit:
- Zigbee-Lampen und Leuchten
- Zigbee-Schalter und Steckdosen
- Zigbee-Sensoren (Temperatur, Bewegung, Türen)
- Zigbee-Router und Repeater
- Weitere Standard-Zigbee 3.0 Geräte

## Installation

- Ethernet-Anschluss an Home Assistant Host-System
- Automatische Erkennung in Home Assistant
- Firmware-Update möglich über Home Assistant Interface

## Platzierung

_Hier können Informationen zum Installationsort und der Netzwerk-Abdeckung hinzugefügt werden._

---

**Status**: In Verwendung
**Letzte Aktualisierung**: 2026-05-16
