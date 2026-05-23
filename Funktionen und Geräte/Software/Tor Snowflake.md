[[Moni's Elektro Base|← Zurück zur Homepage]]
# Übersicht

## Funktion

Tor Snowflake ist eine Proxy-Software, die Menschen in zensierten Regionen Zugang zum Tor-Netzwerk ermöglicht. Sie fungiert als Brücke zwischen Nutzern, die keinen direkten Zugang zu Tor haben, und dem freien Internet.

## Was ist Tor Snowflake?

Snowflake ist ein Tor-Brückensystem, das die Zensur umgeht, indem es echte Browser nutzt, um als temporäre Proxies zu fungieren. Statt eines zentralisierten Proxy-Systems verwenden tausende von freiwilligen Browsern (Snowflakes) ihre Rechenleistung, um zensurbehinderten Nutzern zu helfen.

## Funktionsweise

- **Dezentrales Proxy-System**: Viele freiwillige Browser werden zu temporären Proxies
- **WebRTC-Protokoll**: Kommunikation über WebRTC für Anonymität
- **Dynamische Adressen**: Keine festen Server, die blockiert werden können
- **Einfache Integration**: Nutzer installieren eine Browser-Erweiterung für Zugang

## Tor Snowflake Betrieb in Moni's Elektro Base

Auf dem [[Proxmox-PVE]] läuft eine dedizierte virtuelle Maschine mit Tor Snowflake. Diese Instanz stellt einen stabilen Proxy zur Verfügung und trägt zum Tor-Netzwerk bei:

- **Kontinuierlicher Betrieb**: 24/7 Verfügbarkeit als freiwilliger Proxy
- **Ressourcenschonung**: Läuft in virtualisierter Umgebung für Effizienz
- **Netzwerk-Unterstützung**: Hilft zensurbehinderten Nutzern weltweit

## Sicherheit und Anonymität

- **Kein Logging**: Keine Speicherung von Verbindungsdaten
- **Verschlüsselung**: Alle Daten sind verschlüsselt
- **Freiwillige Beiträge**: Die Operator können nicht sehen, wer ihre Proxies nutzt
- **Open-Source**: Transparente und überprüfbare Software

## Vorteile des Betriebs

- **Gesellschaftliche Verantwortung**: Unterstützung von Internetzugangsfreiheit
- **Minimale Ressourcen**: Geringer CPU- und Speicherbedarf
- **Keine Rechtlichen Bedenken**: Legaler Betrieb zur Unterstützung digitaler Freiheit
- **Einfache Verwaltung**: Automatische Updates und wartungsarm

## Installation und Verwaltung

Der Betrieb erfolgt über eine containerisierte Tor-Snowflake-Instanz auf dem [[Proxmox-PVE]]. Die Software wird von der Tor-Foundation bereitgestellt und regelmäßig aktualisiert.

## Beitrag zum Tor-Projekt

Durch den Betrieb von Tor Snowflake trägt Moni's Elektro Base aktiv zum freien und zensurfreien Internet bei. Das System hilft Menschen in repressiven Ländern, ihre Grundrechte auf Informationsfreiheit auszuüben.

https://snowflake.torproject.org/de/
---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
