[[Moni's Elektro Base|← Zurück zur Homepage]]

# OpenDTU

![[OpenDTU.webp|300]]

## Übersicht

OpenDTU ist eine Open-Source Alternative zu Hoymiles Cloud-Monitoring. Die Software ermöglicht die direkte Kommunikation mit Hoymiles Wechselrichtern und bietet lokales Monitoring ohne Cloud-Abhängigkeit.

Der Zugang erfolgt über http://192.168.2.31/

## Funktion

- **Direkte Wechselrichter-Kommunikation**: Verbindung via DTU-Dongle (Hoymiles 2400/600)
- **Lokales Webinterface**: Browser-basiertes Dashboard
- **Echtzeit-Daten**: Live-Leistung und Ertragsdaten
- **MQTT-Export**: Integration mit Home Assistant
- **API**: REST-API für externe Anwendungen
- **Unabhängig von Cloud**: Keine Internetverbindung erforderlich

## Spezifikationen

| Eigenschaft | Wert |
|---|---|
| **Programmiersprache** | C++ (PlatformIO) |
| **Hardware** | ESP32 oder kompatibel |
| **Betriebssystem** | Linux, Windows, macOS |
| **Anforderungen** | 100-200MB RAM, WiFi |
| **Lizenz** | MIT (Open-Source) |
| **Community** | Aktiv, GitHub-basiert |

## Hardware-Anforderungen

- **ESP32 Mikrocontroller** (z.B. Wemos D1 Mini)
- **Hoymiles DTU-Dongle** (2400 oder 600 Serie)
- **WiFi-Verbindung**
- **Stromversorgung** (5V USB)

## Installation

1. **Hardware zusammenstellen**: ESP32 + DTU-Dongle verbinden
2. **Firmware flashen**: Via PlatformIO oder Web-Installer
3. **WiFi konfigurieren**: AP-Modus → Netzwerk-Einstellungen
4. **Web-Interface**: `http://opendtu.local` aufrufen
5. **DTU-Dongle pairen**: Wechselrichter-Konfiguration

## Home Assistant Integration

MQTT-Integration für automatische Übernahme:
```yaml
mqtt:
  broker: localhost

sensor:
  - platform: mqtt
    name: "OpenDTU Power"
    state_topic: "dtu/123456/power"
```

## Web-Interface

- **Dashboard**: Live-Ansicht aller Wechselrichter
- **Statusseite**: Detaillierte Fehlerdiagnose
- **Einstellungen**: DTU- und WiFi-Konfiguration
- **Überwachung**: Voltages, Currents, Temperaturen
- **Historisch**: Tagesertrag und Statistiken

## MQTT-Topik-Struktur

```
dtu/
  ├── inverter_name/
  │   ├── power_ac
  │   ├── power_dc
  │   ├── voltage_ac
  │   ├── energy_total
  │   └── temperature
```

## Sicherheit & Datenschutz

- **Lokal gehostet**: Keine Cloud-Abhängigkeit
- **WiFi-Verschlüsselung**: WPA2/WPA3 unterstützt
- **Keine Datenübertragung**: Alle Daten bleiben lokal
- **API-Authentifizierung**: Optional konfigurierbar

## Wartung & Updates

- **Regelmäßige Updates**: Via GitHub-Releases
- **Backup**: Einstellungen exportieren
- **Logs**: Für Fehlersuche verfügbar
- **Community Support**: GitHub Discussions und Issues

## Fehlerbehebung

- **Keine Verbindung**: DTU-Dongle prüfen, Kabelverbindung
- **MQTT-Fehler**: Broker-Konfiguration prüfen
- **WiFi-Dropout**: Signal-Qualität verbessern
- **Logs prüfen**: Web-Interface → System-Logs

## Links & Ressourcen

- [GitHub OpenDTU](https://github.com/tbnobody/OpenDTU)
- [Dokumentation](https://github.com/tbnobody/OpenDTU/wiki)
- [Community Discord](https://discord.gg/CwwefnebqD)
- [MQTT Home Assistant Guide](https://www.home-assistant.io/integrations/mqtt/)
