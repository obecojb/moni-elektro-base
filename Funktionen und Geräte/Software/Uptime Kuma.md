[[Moni's Elektro Base|← Zurück zur Homepage]]

# Uptime Kuma

![[UptimeKuma.webp]]

## Übersicht

Uptime Kuma ist ein einfaches, benutzerfreundliches Open-Source Monitoring- und Statusseiten-Tool. Es dient der Überwachung von Website-Verfügbarkeit, Servern und Services in Echtzeit.

![[]]
## Funktion

Uptime Kuma überwacht automatisch:
- Website-Verfügbarkeit und Response-Zeiten
- HTTP/HTTPS-Status und SSL-Zertifikate
- Port-Verfügbarkeit und Erreichbarkeit
- Ping-Ergebnisse und Netzwerk-Konnektivität
- Docker-Container-Status
- DNS und Custom-Skripte

Alarme werden per Email, Slack, Discord, Telegram und anderen Kanälen versendet.

## Spezifikationen

- **Lizenz**: MIT (Open-Source)
- **Sprache**: Node.js/Vue.js
- **Betriebssystem**: Linux, Windows, macOS, Docker
- **Ressourcen**: Minimal (ca. 50-100MB RAM)
- **Datenbank**: SQLite (lokal) oder Datenbank-Backend

## Zugang

1. Web-Interface aufrufen: `http://localhost:3001`

## Monitore konfigurieren

**HTTP/HTTPS Monitoring:**
- URL eingeben
- Intervall festlegen (z.B. 60 Sekunden)
- Accept-Status-Codes definieren
- Keywords zum Prüfen optional

**Port-Überwachung:**
- Host und Port angeben
- Protokoll wählen (TCP/UDP)
- Timeout setzen

## Home Assistant Integration

Uptime Kuma kann via REST API in Home Assistant integriert werden:

```yaml
rest_command:
  uptime_kuma_status:
    url: "http://localhost:3001/api/status-page/{{ page_slug }}"
    method: GET
```

## Statusseite

Öffentliche Statusseite für Benutzer:
- Echtzeit-Status aller Monitore
- Incident-Historie
- Customize-bar Design
- Mehrsprachig
- SSL-Verschlüsselung

## Wartung

- **Backups**: Regelmäßige Datensicherung der SQLite-Datenbank
- **Updates**: Docker-Image regelmäßig updaten
- **Logs**: Unter `/data/logs` prüfen
- **Performance**: Bei vielen Monitoren (>100) Datenbank-Backend erwägen

## Tipps & Tricks

- Redundante Monitoring-Standorte für kritische Services
- Automatische Incident-Benachrichtigungen konfigurieren
- Statusseite öffentlich machen für Transparenz
- API-Zugriff für Automatisierung nutzen

## Dokumentation

- [GitHub Repository](https://github.com/louislam/uptime-kuma)
- [Offizielle Docs](https://uptime.kuma.pet)
- [Community-Forum](https://github.com/louislam/uptime-kuma/discussions)

---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
