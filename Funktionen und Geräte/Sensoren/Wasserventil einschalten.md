# Wasserventil einschalten

Tags: #home-assistant #automation #sonoff #bewässerung

## Gerät

| Eigenschaft | Wert |
|-------------|------|
| Entity-ID | `switch.wasserdurchlauf_rot` |
| Gerät | SONOFF SWV-ZFE (Zigbee) |
| Problem | Ventil schaltet nach 10 Min automatisch ab (Workaround via Watchdog) |

## Betriebszeit

Täglich **06:00 – 21:00 Uhr** eingeschaltet.

## Automationen

HA → Einstellungen → Automationen → + Automation erstellen → YAML-Editor

### Automation 1: Einschalten 06:00

```yaml
alias: Ventil einschalten 06:00
trigger:
  - platform: time
    at: "06:00:00"
action:
  - service: switch.turn_on
    target:
      entity_id: switch.wasserdurchlauf_rot
```

### Automation 2: Ausschalten 21:00

```yaml
alias: Ventil ausschalten 21:00
trigger:
  - platform: time
    at: "21:00:00"
action:
  - service: switch.turn_off
    target:
      entity_id: switch.wasserdurchlauf_rot
```

### Automation 3: Watchdog alle 9 Minuten

Greift nur wenn das Ventil zwischen 06:00 und 21:00 unerwartet aus ist — maximale Unterbrechung 9 Minuten.

```yaml
alias: Ventil Watchdog
trigger:
  - platform: time_pattern
    minutes: "/9"
condition:
  - condition: time
    after: "06:00:00"
    before: "21:00:00"
  - condition: state
    entity_id: switch.wasserdurchlauf_rot
    state: "off"
action:
  - service: switch.turn_on
    target:
      entity_id: switch.wasserdurchlauf_rot
```

## Verwandte Notes

- [[SONOFF SWV-ZFE - Auto-Abschaltung deaktivieren]]
- [[Zigbee2MQTT Setup]]
