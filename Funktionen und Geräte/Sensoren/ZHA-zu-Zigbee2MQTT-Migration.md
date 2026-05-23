# ZHA → Zigbee2MQTT Migration

**Datum:** 2026-05-22  
**System:** HAOS als VM unter Proxmox 9.1.9  
**Dongle:** SONOFF Zigbee/Thread PoE Dongle Max (USB-Passthrough)  
**Geräte:** 10 Zigbee-Geräte müssen neu angelernt werden

---

## Vorbereitung

- [ ] Liste aller 10 Zigbee-Geräte erstellen (Name, Raum, Funktion)
- [ ] Entitätsnamen notieren, die in Automationen/Skripten verwendet werden  
  → Diese ändern sich nach der Migration und müssen angepasst werden
- [ ] Snapshot der HAOS-VM in Proxmox erstellen (Fallback)

---

## Schritt 1 – Mosquitto Add-on installieren

1. HA → **Einstellungen → Add-ons → Add-on Store**
2. „Mosquitto broker" suchen und installieren
3. Add-on starten, „Beim Start aktivieren" einschalten
4. HA → **Einstellungen → Integrationen → MQTT** hinzufügen  
   → Hostname: `core-mosquitto`, Port: `1883`

---

## Schritt 2 – ZHA deaktivieren

1. HA → **Einstellungen → Integrationen**
2. ZHA-Integration öffnen → **Deaktivieren**  
   ⚠️ Noch **nicht löschen** – erst nach erfolgreichem Z2M-Setup

---

## Schritt 3 – Zigbee2MQTT Add-on installieren

1. HA → **Einstellungen → Add-ons → Add-on Store**
2. Oben rechts: Drei-Punkte-Menü → **„Repositories"**  
   URL hinzufügen: `https://github.com/zigbee2mqtt/hassio-zigbee2mqtt`
3. „Zigbee2MQTT" suchen und installieren

---

## Schritt 4 – Zigbee2MQTT konfigurieren

Add-on-Konfiguration (YAML-Tab):

```yaml
data_path: /config/zigbee2mqtt
socat:
  enabled: false
  master: pty,raw,echo=0
  slave: tcp-listen:8485,keepalive,nodelay,reuseaddr,keepidle=1,keepintvl=2,keepcnt=5
  options: "-d -d"
  log: false
```

Dann in der Datei `/config/zigbee2mqtt/configuration.yaml` (über HA File Editor oder SSH):

```yaml
homeassistant: true
permit_join: false
mqtt:
  base_topic: zigbee2mqtt
  server: mqtt://core-mosquitto
serial:
  port: /dev/ttyUSB0   # ggf. anpassen – siehe Hinweis unten
frontend:
  port: 8099
```

> **Dongle-Pfad ermitteln:**  
> HA → Einstellungen → System → Hardware → Alle Hardware  
> SONOFF-Dongle sucht nach `ttyUSB0` oder `ttyACM0`

---

## Schritt 5 – Add-on starten & prüfen

1. Z2M Add-on starten
2. Logs beobachten – auf Fehler achten (serieller Port, MQTT-Verbindung)
3. Z2M Frontend aufrufen: `http://<HA-IP>:8099`

---

## Schritt 6 – Geräte neu anlernen

1. Z2M Frontend → **„Permit join (All)"** aktivieren (60 Sek.)
2. Jedes Gerät in den Pairing-Modus versetzen (gerätespezifisch, meist Reset-Taste)
3. Gerät erscheint in Z2M → Namen vergeben
4. Wiederholen für alle 10 Geräte
5. „Permit join" danach wieder **deaktivieren**

> **Tipp:** Geräte einzeln anlernen, nicht alle gleichzeitig.

---

## Schritt 7 – Entitäten in HA prüfen & Automationen anpassen

- HA → **Einstellungen → Integrationen → MQTT** → Entitäten prüfen
- Alte ZHA-Entitätsnamen (`zha.`) wurden durch neue ersetzt (`sensor.`, `light.` etc.)
- Alle Automationen, Skripte und Dashboards auf neue Entitätsnamen aktualisieren

---

## Schritt 8 – ZHA endgültig entfernen

Erst wenn alles funktioniert:

1. HA → **Einstellungen → Integrationen → ZHA → Löschen**
2. ZHA Add-on (falls installiert) deinstallieren

---

## Nützliche Links

- [Zigbee2MQTT Dokumentation](https://www.zigbee2mqtt.io/)
- [Zigbee2MQTT HA Add-on Repository](https://github.com/zigbee2mqtt/hassio-zigbee2mqtt)
- [Mosquitto Add-on](https://github.com/home-assistant/addons/tree/master/mosquitto)
- [Zigbee2MQTT Geräteliste](https://www.zigbee2mqtt.io/supported-devices/)

---

## Status

- [ ] Vorbereitung abgeschlossen
- [ ] Mosquitto installiert
- [ ] ZHA deaktiviert
- [ ] Z2M installiert & konfiguriert
- [ ] Alle 10 Geräte angelernt
- [ ] Automationen angepasst
- [ ] ZHA gelöscht

---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
