[[Moni's Elektro Base|← Zurück zur Homepage]]

# Der Weg zu Home Assistant

**Tags:** #homeassistant #zigbee #mqtt #smarthome #proxmox

## Grundlagen: Was ist Zigbee?

Zigbee ist ein drahtloses Kommunikationsprotokoll für Smart-Home-Geräte. Es basiert auf IEEE 802.15.4 und arbeitet im 2,4-GHz-Frequenzband (das gleiche wie WiFi, aber mit besserer Koexistenz).

**Vorteile von Zigbee:**
- **Energieeffizient**: Batterien halten Monate/Jahre
- **Sicher**: AES-128-Verschlüsselung
- **Netzwerk-Fähig**: Geräte können sich gegenseitig verstärken (Mesh)
- **Zuverlässig**: Mit anderen 2,4-GHz-Netzwerken kompatibel

**Zigbee-Gerätetypen:**
- **Coordinator**: Zentrale Steuereinheit (Dongle)
- **Router**: Verbindungsverstärker
- **End-Devices**: Sensoren, Schalter, Lampen (batteriebetrieben)

---

## Datenfluss: Vom Gerät zu Home Assistant

Vom physischen Zigbee-Gerät bis zur Sensor-Entität in Home Assistant gibt es zwei bewährte Ansätze.

![[Zigbee-Datenweg-HomeAssistant.webp]]
---

## Zigbee2MQTT + MQTT-Broker

Dies ist die **professionelle und flexible Lösung** für umfangreiche Zigbee-Netzwerke.

### Datenfluss-Diagramm

```
Zigbee-Gerät (Sensor, Schalter, Lampe)
    ↓  2,4 GHz Funksignal
Zigbee-Dongle (USB-Stick)     ← USB-Passthrough in Proxmox
    ↓  Serielle Datenübertragung
Zigbee2MQTT (Software)         ← Docker-Container oder HA Add-on
    ↓  MQTT-Protokoll über TCP
MQTT-Broker Mosquitto          ← HA Add-on oder separater Container
    ↓  Lokales Netzwerk
Home Assistant MQTT-Integration ← abonniert und verarbeitet Nachrichten
    ↓
Sensor-Entität in HA Dashboard
```

### Komponenten und ihre Funktionen

| Komponente | Funktion | Details |
|---|---|---|
| **Zigbee-Dongle** | Empfängt/sendet Zigbee-Funk | USB-Passthrough erforderlich bei Proxmox-VMs |
| **Zigbee2MQTT** | Dekodiert Protokoll, konvertiert zu JSON | Unterstützt 4000+ Gerätemodelle |
| **Mosquitto-Broker** | Zentrale Nachrichtenverteilung | Alle Komponenten kommunizieren über MQTT-Topics |
| **HA MQTT-Integration** | Empfängt Daten, erstellt Entitäten | Auto-Discovery erkennt neue Geräte automatisch |

### Stärken dieser Variante

✅ **Maximale Gerätekompatibilität** – unterstützt fast alle Zigbee-Geräte auf dem Markt
✅ **Flexible Konfiguration** – detailliertes Logging und Debugging möglich
✅ **Unabhängig von Home Assistant** – funktioniert auch bei HA-Updates
✅ **MQTT ist Standard** – kann mit anderen Smart-Home-Systemen kommunizieren

### Herausforderungen

⚠️ **Mehr Komponenten** – mehrere Dienste müssen aktiv sein
⚠️ **Höherer Aufwand** – Einrichtung und Troubleshooting komplexer
⚠️ **Ressourcen-Verbrauch** – mehrere Container benötigen CPU/RAM

---


---

## Netzwerk-Sicherheit bei Zigbee

- **Verschlüsselung**: AES-128 (standard)
- **Pairing-Prozess**: Geräte müssen manuell "gejoint" werden
- **Isolierung**: Zigbee-Netzwerk ist lokal und braucht kein Internet
- **Best Practice**: Regelmäßig Join-Fenster schließen nach Pairing

---

## Hardware-Anforderungen

### Zigbee-Dongle (Coordinator)

Empfohlene Modelle:
- **SONOFF Zigbee 3.0 USB Dongle Plus** (beliebter, zuverlässig)
- **ConBee II/III** (sehr kompatibel, etwas teurer)
- **Zigbee2MQTT Support List** [hier prüfen](https://www.zigbee2mqtt.io/guide/adapters/)

### USB-Passthrough bei Proxmox

Bei Proxmox-VM muss der USB-Dongle der HAOS-VM zugeordnet werden:
1. VM-Konfiguration öffnen
2. **Hardware-Dongle hinzufügen**
3. USB-Dongle auswählen und passthrough aktivieren

---

## Troubleshooting-Tipps

| Problem | Lösung |
|---|---|
| Geräte verbinden sich nicht | Dongle-Position überprüfen, Join-Fenster offen? |
| Verzögerte Reaktion | Mesh-Netzwerk schwach, Router-Geräte hinzufügen |
| Geräte fallen oft weg | Netzwerk-Interferenz? 2,4-GHz-WiFi-Kanal anpassen |
| Zigbee2MQTT startet nicht | Docker-Logs prüfen: `docker logs zigbee2mqtt` |
| ZHA erkennt Dongle nicht | USB-Permissions prüfen, neuen Pairing-Key versuchen |

---

## Setup in dieser Installation (Moni's Elektro Base)

**Hardware:**
- Zigbee-Dongle: SONOFF Zigbee/Thread PoE Dongle Max
- Platzierung: Zentral im Haus für beste Reichweite
- Stromversorgung: PoE oder USB


---

## Dokumentation & Weitere Ressourcen

- [📖 Zigbee2MQTT Dokumentation](https://www.zigbee2mqtt.io/)
- [📖 ZHA Home Assistant Integration](https://www.home-assistant.io/integrations/zha/)
- [📖 Mosquitto MQTT Broker](https://mosquitto.org/)
- [📋 Zigbee2MQTT Geräte-Support](https://www.zigbee2mqtt.io/supported-devices/)
- [🎓 Zigbee-Standard IEEE 802.15.4](https://en.wikipedia.org/wiki/IEEE_802.15.4)
- [🐧 Docker Hub Zigbee2MQTT](https://hub.docker.com/r/koenkk/zigbee2mqtt)

---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
