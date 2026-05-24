[[Moni's Elektro Base|← Zurück zur Homepage]]

# SONOFF SWV-ZFE – Zigbee Smart Wasserventil

Tags: #home-assistant #zigbee2mqtt #sonoff #bewässerung

## Produktbeschreibung

Der SONOFF SWV-ZFE ist ein intelligentes Zigbee-Wasserventil zur automatisierten Bewässerungssteuerung und Wassermanagement. Das Ventil wird direkt an den Wasserhahn oder die Wasserleitung angeschlossen und ermöglicht die Fernsteuerung über Zigbee2MQTT und [[Funktionen und Geräte/Software/Home Assistant|Home Assistant]].

## Funktionen

- **Fernsteuerung**: Ventil öffnen/schließen via Zigbee und Home Assistant
- **Timer-Bewässerung**: Programmierbare Bewässerungszeiten und -dauer
- **Wassermengenmessung**: Integrierter Durchflusssensor erfasst Verbrauch in Litern
- **Automatische Abschaltung**: Schutz bei Wassermangel oder Leckage
- **Zyklische Bewässerung**: Wiederholende Bewässerungsprogramme konfigurierbar
- **Batteriestatus**: Überwachung des Ladezustands über Home Assistant
- **Frostschutz**: Warnung bei niedrigen Temperaturen

## Einsatzgebiete

- **Gartenbewässerung**: Automatische Rasen- und Beetbewässerung
- **Balkonpflanzen**: Zeitgesteuerte Bewässerung
- **Gewächshaus**: Kontrollierte Wasserzufuhr
- **Notabschaltung**: Wasserzufuhr bei Leck automatisch unterbrechen

## Home Assistant Integration

Über [[Funktionen und Geräte/Sensoren/Ziggbee2MQT auf Proxmox|Zigbee2MQTT]] wird das Ventil automatisch erkannt. Verfügbare Entitäten:

- `switch.sonoff_swv_zfe` – Ventil auf/zu
- `sensor.sonoff_swv_zfe_water_consumed` – Wasserverbrauch (Liter)
- `sensor.sonoff_swv_zfe_battery` – Batteriestand (%)

---

## Bekanntes Problem: Auto-Abschaltung

## Problem

Das Ventil schaltet sich nach kurzer Zeit (~10 Min) selbst ab, obwohl `auto_close_when_water_shortage` deaktiviert ist. Ursache: Im Gerät ist ein interner Bewässerungsplan (`schedule`) aktiv, erkennbar an folgendem Log-Eintrag in Z2M:

```json
{
  "actual_end_time": "2026-05-24T08:00:15+02:00",
  "actual_irrigation_amount": 0,
  "expected_end_time": "2026-05-24T08:03:46+02:00",
  "irrigation_mode": "duration",
  "schedule_index": 0
}
```

## Lösung per Wachtdog ##

Unsere Lösung siehe hier:[[Wasserventil einschalten]]

## Lösung: cyclic_timed_irrigation zurücksetzen

### Voraussetzung: MQTT Explorer

- Download: https://mqtt-explorer.com
- Verbinden mit Mosquitto-Broker:
  - Host: IP des Proxmox-Hosts
  - Port: `1883`
  - Kein Login nötig (sofern kein Auth konfiguriert)

### MQTT-Payload senden

| Feld | Wert |
|------|------|
| Topic | `zigbee2mqtt/GERÄTENAME/set` |
| Payload | siehe unten |

```json
{
  "cyclic_timed_irrigation": {
    "current_count": 0,
    "total_number": 0,
    "duration": 0,
    "interval": 0
  }
}
```

→ Im MQTT Explorer: Topic eintragen, Payload einfügen, **Publish** klicken.

## Gerätestatus (Stand Mai 2026)

| Eigenschaft | Wert |
|-------------|------|
| Firmware | 1.0.7 (Build 4103) |
| `auto_close_when_water_shortage` | DISABLE |
| Zigbee-Stack | Zigbee2MQTT |
| Koordinator | SONOFF Zigbee/Thread PoE Dongle Max |

## Ventil manuell steuern

```json
// Auf
{ "state": "ON" }

// Zu
{ "state": "OFF" }

// Auf für bestimmte Dauer (Sekunden)
{ "state": "ON", "on_time": 300 }
```

Topic immer: `zigbee2mqtt/GERÄTENAME/set`

## Verbrauchsdaten abrufen

```json
{
  "read_swvzf_records": {
    "type": "24_hours",
    "time_start": "2026-05-24T00:00:00+02:00",
    "time_end": "2026-05-24T23:59:59+02:00"
  }
}
```

`type` kann sein: `24_hours`, `30_days`, `6_months`

## Verwandte Notes

- [[Funktionen und Geräte/Sensoren/Ziggbee2MQT auf Proxmox|Zigbee2MQTT auf Proxmox]]
- [[Funktionen und Geräte/Software/Home Assistant|Home Assistant]]
- [[Funktionen und Geräte/Sensoren/Sensoren Übersicht|Sensoren Übersicht]]

---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
