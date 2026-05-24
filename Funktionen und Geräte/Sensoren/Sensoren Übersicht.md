[[Moni's Elektro Base|← Zurück zur Homepage]]

# Sensoren Übersicht

## Funktion von Sensoren in Home Assistant

Sensoren sind die Datenquellen des Smart-Home Systems. Sie erfassen Zustände, Messwerte und Informationen aus der physischen Umgebung und stellen diese Home Assistant zur Verfügung.

Neben den Sensoren für den Bereich [[Funktionen und Geräte/Photovoltaik/Balkonkraftwerk|Stromerzeugung]] und [[Funktionen und Geräte/Photovoltaik/Marstek Venus 3|Stromspeicherung]] haben wir weitere Sensoren im Einsatz:
- [[Gasverbrauch]] unserer Heizung
- CO Überwachung
- Feuchtigkeitsmessung im Gewächshaus
- Wassersensor bei Wasseraustritt

## Bedeutung für Home Assistant

Sensoren bilden das **Nervensystem** der Hausautomation:
- **Informationsbeschaffung**: Erfassung von Umweltzuständen
- **Automatisierungsgrundlage**: Daten für Automatisierungen nutzen
- **Überwachung**: Echtzeit-Monitoring von Geräten und Systemen
- **Entscheidungsfindung**: Basis für intelligente Automatisierungen
- **Visualisierung**: Anzeige von Daten im Dashboard

## Sensortypen

### 1. **Temperatur-Sensoren**
- Messung von Raumtemperatur, Außentemperatur
- Integration mit Heizung und Klimaanlage
- Threshold-Alarme bei Zu- oder Abweichungen
- Beispiel: [[Zigbee Daten im HomeAssistant|Zigbee]] Temperatur-Sensor

### 2. **Feuchte-Sensoren**
- Luftfeuchtigkeit in Räumen
- Erkennung von feuchten Räumen (Bad, Keller)
- Automatische Lüftung bei hoher Feuchte
- Integration mit Luftbefeuchtern/Entfeuchtern

### 3. **Bewegungs-Sensoren (PIR)**
- Anwesenheitserkennung
- Automatische Beleuchtung
- Sicherheits-Überwachung
- Energiesparende Automatisierungen

### 4. **Türöffnungs-Sensoren**
- Erfassung von Tür-/Fenster-Status
- Sicherheitsalarme bei unbefugtem Zugang
- Automatische Heizung beim Lüften
- Integration mit Türschlössern

### 5. **Helligkeits-Sensoren**
- Messung des Umgebungslichts
- Intelligente Lichtsteuerung (Tageslicht-Kompensation)
- Automatische Jalousien-Steuerung
- Energieeffiziente Beleuchtung

### 6. **Luftqualitäts-Sensoren**
- CO₂-Messung, VOC-Erfassung
- Lüftungsautomatik
- Gesundheits- und Wohlbefinden-Monitoring
- Allergiker-Optimierung

### 7. **Energie-Sensoren**
- **Stromverbrauch**: Wattage, Kilowattstunden
- **Spannung & Strom**: Netzqualität
- **Kosten-Tracking**: Verbrauchskosten
- Beispiel: Smartmeter, [[Smartmeter]]

### 8. **Wetter-Sensoren**
- Außentemperatur, Niederschlag, Wind
- UV-Index, Luftdruck
- Integration mit Online-Wetter-APIs
- Automatische Jalousien bei Sonne/Regen

### 9. **Wasser-Sensoren**
- Wasserlecks erkennen mit dem [[Shelly SHWT-1]]
- Wasserdurchfluss messen mit dem [[SONOFF SWV-ZFE - Auto-Abschaltung deaktivieren| Sonoff SWV-ZFE]]
- Infiltrationserkennung in Kellern
- Sicherheitsalarme

### 10. **Gas-Sensoren**
- CO-Detektion (Kohlenmonoxid)
- Rauchmelder-Integration
- Notfall-Alarme
- Sicherheitskritisch

## Sensor-Datentypen

| Typ | Beispiel | Einheit | Verwendung |
|---|---|---|---|
| **Numerisch** | Temperatur | °C | Berechnungen, Schwellwerte |
| **Boolean** | Bewegung erkannt | An/Aus | Automatisierungen |
| **Text** | Wetterlage | "Bewölkt" | Anzeige, Konditionalen |
| **Zeit** | Letzte Aktivität | Timestamp | Timing-basierte Automatisierung |
| **Energie** | Stromverbrauch | kWh, W | Kosten- und Verbrauchsanalyse |

## Integration in Home Assistant

### Standard-Integrationen
```yaml
sensor:
  - platform: template
    sensors:
      wohnzimmer_temperatur:
        unique_id: wohnzimmer_temp
        unit_of_measurement: °C
        value_template: "{{ states('sensor.wohnzimmer_thermometer') }}"
```

### MQTT-Sensoren
Sensoren, die über MQTT-Protokoll Daten senden:
```yaml
mqtt:
  sensor:
    - unique_id: balkon_temperatur
      state_topic: "home/balkon/temp"
      unit_of_measurement: "°C"
```

### Integration von Smart-Geräten
- **Zigbee**: Direkte Integration über Zigbee Coordinator
- **WiFi**: Integration über IP-Schnittstellen
- **Z-Wave**: Z-Wave-Stick für Z-Wave Sensoren
- **Cloud-APIs**: Online-Dienste (Wetter, Energieanbieter)

## Automatisierungen basierend auf Sensoren

**Beispiel 1: Intelligente Beleuchtung**
```yaml
automation:
  - alias: "Licht bei Bewegung an"
    trigger:
      platform: state
      entity_id: binary_sensor.bewegung
      to: "on"
    condition:
      condition: numeric_state
      entity_id: sensor.helligkeit
      below: 300
    action:
      service: light.turn_on
      target:
        entity_id: light.wohnzimmer
```

**Beispiel 2: Notfall-Alarm bei Rauch**
```yaml
automation:
  - alias: "Rauchmelder Alarm"
    trigger:
      platform: state
      entity_id: binary_sensor.rauchmelder
      to: "on"
    action:
      - service: notify.push
        data:
          message: "⚠️ RAUCH ERKANNT!"
      - service: light.turn_on
        target:
          entity_id: light.alle
```

## Sensor-Wartung

### Regelmäßige Aufgaben
- **Batterie-Check**: Sensoren mit Batterien monatlich prüfen
- **Kalibrierung**: Temperatur-Sensoren jährlich kalibrieren
- **Firmware**: Updates für kabellose Sensoren durchführen
- **Reichweite**: WiFi/Zigbee-Signalstärke prüfen
- **Reinigung**: Optische Sensoren (Bewegung, Helligkeit) reinigen

### Fehlerbehandlung
- **Sensor offline**: Batterien, Verbindung, Reichweite prüfen
- **Ungenaue Werte**: Kalibrierung oder Sensorplatzer
- **Fehlende Daten**: Kommunikationsprobleme diagnostizieren

## Best Practices

✅ **Empfohlen:**
- Redundante Sensoren für kritische Werte
- Kalibrierung dokumentieren
- Firmware regelmäßig updaten
- Batteriewechsel-Termine kalkulieren
- Sensor-Platzierung nach Herstellervorgaben

❌ **Vermeiden:**
- Billig-Sensoren für kritische Funktionen
- Zu viele Sensoren im gleichen Raum (Interferenz)
- Sensoren ohne Fernauslesung-Option
- Veraltete/unsichere Protokolle
- Keine Backups der Sensor-Konfiguration

## Beliebte Sensor-Geräte

| Gerät | Typ | Protokoll | Kosten |
|---|---|---|---|
| [[Zigbee]] Temperatur-Sensor | Temperatur/Feuchte | Zigbee | €20-40 |
| Bewegungsmelder | Bewegung | Zigbee/WiFi | €15-50 |
| Türkontakt | Tür/Fenster | Zigbee/WiFi | €10-30 |
| [[Smartmeter]] | Energie | MBus/IR | €0-100 |
| Luftqualität-Sensor | Luftqualität | WiFi/Zigbee | €40-100 |

## Dokumentation & Links

- [Home Assistant Sensor Integration](https://www.home-assistant.io/integrations/sensor/)
- [MQTT Sensor Documentation](https://www.home-assistant.io/integrations/mqtt_sensor/)
- [Zigbee Sensors](https://www.home-assistant.io/integrations/zigbee/)
- [Automation Examples](https://www.home-assistant.io/docs/automation/examples/)

---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
