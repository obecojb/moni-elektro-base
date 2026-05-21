[[Moni's Elektro Base|← Zurück zur Homepage]]

# Gasmelder - Shelly Gas

## Übersicht

Der Shelly Gas (SHGS-1) ist ein intelligenter Gassensor zur Erkennung von Erdgas und anderen brennbaren Gasen. Das Gerät bietet Echtzeit-Überwachung mit Alarmmeldungen direkt in Home Assistant und ermöglicht schnelle Reaktion bei Gaslecks.

## Gerätebeschreibung

Der Shelly Gas ist ein kompakter WiFi-fähiger Sensor mit integriertem Katalytische-Perlen-Sensor (Pellistor). Er erkennt Konzentrationsänderungen und warnt vor gefährlichen Gaskonzentrationen.

## Spezifikationen

| Eigenschaft | Wert |
|---|---|
| **Hersteller** | Allterco Robotics (Shelly) |
| **Modell** | SHGS-1 |
| **Sensor-Typ** | Katalytische Perlen (Pellistor) |
| **Erkannte Gase** | Methan, Butan, Propan, Wasserstoff |
| **Messbereich** | 0-100% LEL (Lower Explosive Limit) |
| **Alarmgrenzwert** | Konfigurierbar (Standard: 15% LEL) |
| **WiFi** | 2.4GHz 802.11b/g/n |
| **Stromversorgung** | USB oder Batterien |
| **Betriebstemperatur** | -10°C bis +50°C |
| **IP-Schutz** | IP44 (Spritzwassergeschützt) |

## Funktionsweise

1. **Gas-Erkennung**: Pellistor-Sensor erkennt brennbare Gase
2. **LEL-Messung**: Berechnet % des unteren Explosionsgrenzenwertes
3. **Alarmauslösung**: Bei Überschreitung automatischer Alarm
4. **Cloud-Benachrichtigung**: Push-Notifications an Smartphone
5. **Home Assistant**: MQTT oder Cloud-Integration

## Installation

1. **Positionnierung**: In Gasküchenbereich (Höhe: ca. 30-60cm vom Boden)
2. **Stromversorgung**: USB-Anschluss oder Batterien einlegen
3. **WiFi konfigurieren**: Shelly Cloud App oder direkt AP-Modus
4. **Home Assistant hinzufügen**: Über Shelly Integration

## Home Assistant Integration

```yaml
# Automatische Integration via Shelly App
# oder manuell:
mqtt:
  broker: localhost

sensor:
  - platform: mqtt
    state_topic: "shellygasshgs-1/status"
    name: "Gasmelder Küche"
    unit_of_measurement: "%"
    value_template: "{{ value_json.gas }}"

binary_sensor:
  - platform: mqtt
    state_topic: "shellygasshgs-1/alarm"
    name: "Gassensor Alarm"
    payload_on: "true"
    payload_off: "false"
```

## Automatisierungen

- **Gasalarm**: Sofort Benachrichtigung + Smartphone-Alert
- **Lüfter aktivieren**: Auto-Lüftung bei erhöhtem Wert
- **Fenster-Alert**: Warnung bei gekipptem Fenster + Gas
- **Nach-Stunden Alarm**: Lauteres Signal nach 22:00 Uhr
- **Kalibrierung**: Tägliche Selbsttest beim Hochfahren

## Sicherheitsfeatures

- ✅ Unabhängig von Cloud funktionsfähig
- ✅ Lokale Alarme + Push-Notifications
- ✅ LED-Anzeige (Rot = Alarm)
- ✅ Akustischer Summer (Alarmton)
- ✅ Selbsttest beim Einschalten

## Wartung & Kalibrierung

- **Monatlich**: Sichtprüfung auf Verschmutzung
- **Jährlich**: Funktionsprüfung mit Testgas
- **Bei Bedarf**: Kalibrierung in frischer Luft
- **Sensor-Lebensdauer**: Ca. 5-7 Jahre
- **Austausch**: Nach Ablaufdatum zwingend erforderlich

## Fehlerbehebung

- **Falsche Messwerte**: Neu kalibrieren in Frischluft
- **Keine Verbindung**: WiFi-Signalstärke prüfen
- **Dauerhafter Alarm**: Tatsächliches Gasleck prüfen!

## Wichtig: Sicherheit

⚠️ **Dies ersetzt KEINE Standard-Gasmelder!** Der Shelly Gas ist ein Smart-Home-Sensor für Automatisierung. Installieren Sie auch konventionelle Gasmelder nach DIN EN 50194!

## Links & Ressourcen

- [Shelly Plus Gas](https://shelly.cloud/products/shelly-plus-gas/)
- [Shelly Cloud App](https://www.shelly.cloud)
- [Home Assistant Shelly Integration](https://www.home-assistant.io/integrations/shelly/)
