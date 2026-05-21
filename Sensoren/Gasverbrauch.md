[[Moni's Elektro Base|← Zurück zur Homepage]]

# Gasverbrauch Sensor

## Übersicht

Der Smartnetz Gasreader ist ein intelligenter Gaszähler-Auslese-Adapter. Er ermöglicht die digitale Überwachung des Gasverbrauchs durch optische Ablesung des Analogzählers und Datenübertragung an Home Assistant via WiFi oder Netzwerk.

## Gerätebeschreibung

Der Gasreader liest die LED-Pulse des Gaszählers optisch aus und wandelt diese in digitale Verbrauchsdaten um. Diese Methode ist vollständig kontaktlos und nichtinvasiv – der Zähler wird nicht modifiziert.

## Spezifikationen

| Eigenschaft | Wert |
|---|---|
| **Hersteller** | Smartnetz / Volkszähler |
| **Modell** | Gasreader / IR-Lesekopf |
| **Schnittstelle** | WiFi / LAN / USB |
| **Stromversorgung** | USB oder Batterie |
| **Messgenauigkeit** | ±1% |
| **Datenerfassung** | Echtzeit Pulse |
| **Kommunikation** | HTTP API / MQTT |
| **IP-Schutz** | IP67 (wasserdicht) |

## Funktionsweise

1. **Optische Erfassung**: IR-Lesekopf erfasst LED-Pulse des Gaszählers
2. **Puls-Zählung**: Jeder Puls = 0,001 m³ Gas
3. **Datenübertragung**: WiFi-Modul sendet Daten an Home Assistant
4. **Echtzeit-Monitoring**: Verbrauch wird sekündlich aktualisiert

## Installation

1. **Hardware positionieren**: IR-Lesekopf auf LED des Gaszählers ausrichten
2. **WiFi konfigurieren**: Gerät in Netzwerk einbinden
3. **IP-Adresse notieren**: Z.B. `192.168.2.50`
4. **Home Assistant Integration**: API konfigurieren

## Home Assistant Integration

```yaml
sensor:
  - platform: rest
    resource: http://192.168.2.50/api/data
    name: "Gasverbrauch"
    unit_of_measurement: "m³"
    value_template: "{{ value_json.counter }}"
    scan_interval: 30
```

MQTT-Alternative:
```yaml
sensor:
  - platform: mqtt
    state_topic: "smartnetz/gas/counter"
    name: "Gasverbrauch"
    unit_of_measurement: "m³"
```

## Automatisierungen

- **Hohe Verbräuche melden**: Alert wenn > 0,5 m³/h
- **Tagesverbrauch tracking**: Automatische Statistiken
- **Leck-Erkennung**: Warnung bei unerwarteter Aktivität nachts
- **Kostenberechnung**: Automatische Kostenrechnung

## Vorteile

- ✅ Nicht-invasiv (kein Umbau nötig)
- ✅ Genaue Echtzeit-Messungen
- ✅ WiFi-Anbindung
- ✅ Günstig im Betrieb
- ✅ Zähler bleibt original

## Wartung

- **Monatlich**: Lesekopf-Positionierung prüfen
- **Alle 6 Monate**: Linse reinigen
- **Jährlich**: Messgenauigkeit verifizieren
- **Batteriewechsel**: Bei drahtlosen Modellen nach 2-3 Jahren

## Fehlerbehebung

- **Keine Daten**: Lesekopf-Ausrichtung prüfen
- **Langsame Reaktion**: WiFi-Signal verbessern
- **Falsche Werte**: Zähler-Kalibrierung überprüfen

## Links & Ressourcen

- [Smartnetz Dokumentation](https://smartnetz.de)
- [Volkszähler Community](https://wiki.volkszaehler.org)
- [Home Assistant REST Integration](https://www.home-assistant.io/integrations/rest/)
