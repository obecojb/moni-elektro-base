[[Moni's Elektro Base|← Zurück zur Homepage]]

# Hoymiles HMS-1600-4t

## Übersicht

Der Hoymiles HMS-1600-4t ist ein fortgeschrittener Mikro-Wechselrichter für Balkonkraftwerke und kleine Solaranlagen. Er wandelt Gleichstrom (DC) von Solarmodulen in Wechselstrom (AC) um und speist diesen ins Stromnetz ein.

## Funktionen

- **4x MPPT-Eingänge**: Optimale Nutzung mehrerer Module
- **WiFi & Bluetooth**: Kabellose Kommunikation und Monitoring
- **Leistungsoptimierung**: Individuelle Steuerung pro Modul
- **Smart Grid Interface**: Netzfrequenz-Erkennung und Abschaltung
- **Datenlogging**: Tägliche Ertragsdaten

## Spezifikationen

| Eigenschaft | Wert |
|---|---|
| **Nennleistung** | 1600W (4 × 400W möglich) |
| **Input DC** | 2 × 16-60V (MPPT-Eingänge) |
| **Output AC** | 230V, 50Hz, max. 7A |
| **Wirkungsgrad** | 96% |
| **Gewicht** | 2,7 kg |
| **Schutzklasse** | IP67 (wasserdicht) |
| **Garantie** | 12 Jahre |

## Installation

1. **Montage**: Sicher im Freien (IP67) anbringen
2. **Verkabelung**: Solarmodule an MPPT-Eingänge anschließen
3. **Netzverbindung**: AC-Ausgang an Hausstrom-Steckdose
4. **Inbetriebnahme**: WiFi konfigurieren, App verbinden

## Home Assistant Integration

Integration via [[Hoymiles]] oder REST API:
```yaml
sensor:
  - platform: template
    sensors:
      hoymiles_power:
        value_template: "{{ states.sensor.hoymiles_power_output }}"
```

## Monitoring & App

- **Hoymiles iSolarCloud**: Offizielle Monitoring-App
- **Home Assistant Integration**: Native Unterstützung
- **CloudAPI**: Für Entwickler und Automatisierung

## Wartung

- **Regelmäßig**: Anschlüsse prüfen, Verschmutzung entfernen
- **Jährlich**: Funktionstests durchführen
- **Firmware**: Regelmäßig Updates einspielen
- **Lagerung**: Bei Nichtnutzung trocken lagern

## Sicherheit

- **NA-Schutz**: Automatische Netztrennung bei Stromausfall
- **Isolationsprüfung**: Eingebauter GFCI-Schutz
- **Überspannungsschutz**: Durch integrierte Varistoren

## Fehlerbehandlung

- LED-Statuscodes für Diagnose
- App-Benachrichtigungen bei Ausfällen
- Selbsttest-Funktion im Startdialog

## Dokumentation & Links

- [Hoymiles HMS-1600-4t Manual](https://hoymiles.com)
- [Home Assistant Hoymiles Component](https://github.com/mnsuperstar/hacs-hoymiles)
- [iSolarCloud Cloud-Portal](https://www.isolarcloud.com)
