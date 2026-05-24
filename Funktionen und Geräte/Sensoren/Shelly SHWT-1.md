[[Moni's Elektro Base|← Zurück zur Homepage]]

# Shelly SHWT-1 – Wasserleck-Sensor

## Übersicht

Der Shelly SHWT-1 (Shelly Flood) ist ein kompakter WiFi-basierter Wasserleck-Sensor zur Erkennung von Wasseraustritt und Überflutungen. Er warnt frühzeitig bei Wassereinbruch und schützt vor kostspieligen Wasserschäden im Haushalt.

## Gerätebeschreibung

Der Sensor verfügt über zwei Kontaktflächen auf der Unterseite, die bei Wasserkontakt einen Alarm auslösen. Zusätzlich misst er die Umgebungstemperatur und liefert diese Daten an [[Funktionen und Geräte/Software/Home Assistant|Home Assistant]].

## Spezifikationen

| Eigenschaft | Wert |
|---|---|
| **Hersteller** | Allterco Robotics (Shelly) |
| **Modell** | SHWT-1 (Shelly Flood) |
| **Sensor-Typ** | Kapazitiver Wassersensor |
| **Temperatur-Sensor** | Integriert (-20°C bis +60°C) |
| **WiFi** | 2.4GHz 802.11b/g/n |
| **Stromversorgung** | CR123A Batterie (3V) |
| **Batterielebensdauer** | Ca. 18 Monate |
| **Abmessungen** | Ø 63 × 18 mm |
| **Gewicht** | 56 g |
| **IP-Schutz** | IP67 (wasserdicht) |

## Funktionsweise

1. **Wassererkennung**: Kontaktflächen auf der Unterseite erkennen Feuchtigkeit
2. **Alarmauslösung**: Sofortige WiFi-Benachrichtigung bei Wasserkontakt
3. **Temperaturmessung**: Kontinuierliche Erfassung der Umgebungstemperatur
4. **Push-Notification**: Alarm über Shelly Cloud App und Home Assistant
5. **Lokaler Alarm**: Akustisches Signal am Gerät

## Einsatzorte

- **Keller**: Schutz vor Wassereinbruch und Rohrbruch
- **Küche**: Unter Spülmaschine und Spüle
- **Bad**: Neben Waschmaschine und Badewanne
- **Heizungsraum**: Erkennung von Leckagen
- **Waschküche**: Unter Waschmaschine und Trockner

## Installation

1. **Batterie einsetzen**: CR123A Batterie einlegen
2. **WiFi konfigurieren**: Shelly Cloud App → Gerät hinzufügen
3. **Positionieren**: Flach auf den Boden legen (Kontaktflächen nach unten)
4. **Testen**: Feuchtes Tuch auf Kontaktflächen → Alarm prüfen

## Home Assistant Integration

Automatische Erkennung über Shelly Integration:

```yaml
# Automatisch via Shelly Integration
# oder manuell via MQTT:
binary_sensor:
  - platform: mqtt
    state_topic: "shellyflood-XXXXXX/sensor/flood"
    name: "Wasserleck Keller"
    payload_on: "true"
    payload_off: "false"
    device_class: moisture

sensor:
  - platform: mqtt
    state_topic: "shellyflood-XXXXXX/sensor/temperature"
    name: "Temperatur Keller"
    unit_of_measurement: "°C"
```

## Automatisierungen

- **Wasseralarm**: Sofort Push-Benachrichtigung + Sirene aktivieren
- **Ventil schließen**: Automatisch Hauptwasserventil schließen (wenn Smart-Ventil vorhanden)
- **Nacht-Alarm**: Verstärkte Benachrichtigung zwischen 22:00 und 06:00
- **Temperatur-Warnung**: Alarm bei Frost (< 3°C) zum Schutz vor Rohrbruch
- **Batterie-Warnung**: Benachrichtigung bei niedrigem Batteriestand

## Wartung

- **Alle 3 Monate**: Funktionstest durchführen
- **Alle 6 Monate**: Kontaktflächen reinigen
- **Alle 18 Monate**: Batterie wechseln (CR123A)
- **Jährlich**: WiFi-Verbindung und Signalstärke prüfen

## Fehlerbehebung

| Problem | Lösung |
|---|---|
| Kein Alarm bei Wasser | Kontaktflächen reinigen, Batterie prüfen |
| Falscher Alarm | Kondenswasser vermeiden, Standort überprüfen |
| Keine WiFi-Verbindung | Signal prüfen, Gerät neu konfigurieren |
| Batterie schnell leer | Häufige Alarme reduzieren, Standort optimieren |

## Links & Ressourcen

- [Shelly Flood Produktseite](https://www.shelly.com/products/shelly-flood)
- [Shelly Cloud App](https://www.shelly.cloud)
- [Home Assistant Shelly Integration](https://www.home-assistant.io/integrations/shelly/)

---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
