## Moni's Elektro Base

Vault dokumentiert alle elektrischen Komponenten im Home Assistant Setup.

## Struktur

- /Komponenten – einzelne HA-Komponenten
- /Assets/Images – Bilder und Logos
- /Anleitungen – Setup-Guides

## Sprache

Immer auf Deutsch antworten und schreiben.

## Arbeitsrichtlinien

- **Fokus**: Home Assistant Dokumentation und Komponenten-Übersicht
- **Neue Dateien**: Benennung mit deutschen Namen (z.B. `Heizung-Sensor.md`)
- **Struktur**: Jede Komponente sollte Funktion, Einbau und Wartung dokumentieren

## Obsidian Publish

- Site wird veröffentlicht und soll öffentlich erreichbar sein
- Google Analytics integriert (für Besucherstatistiken)
- Keine sensitiven Konfigurationsdaten (Passwörter, API-Keys) dokumentieren

## Zusammenarbeit mit Claude

- Bei neuen Komponenten: Vorher fragen, bevor ich Dateien erstelle
- Änderungen an bestehenden Dateien: Direkt umsetzen
- Bei Fragen zum Home Assistant: Auf Deutsch antworten, auch wenn technische Begriffe englisch sind

## Komponenten-Template

Jede neue Komponente sollte folgende Struktur haben:
- **Funktion**: Wofür ist die Komponente?
- **Spezifikationen**: Modell, Stromverbrauch, Abmessungen
- **Installation**: Schritt-für-Schritt Anleitung
- **Home Assistant Integration**: Wie wird sie eingebunden?
- **Wartung**: Wartungsintervalle, Troubleshooting
- **Links**: Herstellerseite, Dokumentation

## Assets & Bilder

- Format: PNG oder JPG (max. 500KB pro Bild)
- Benennung: `Komponenten-Name_Beschreibung.png`
- Ordner: Gruppierung nach Komponententyp (z.B. `Sensoren/`, `Aktoren/`)

## Interne Verlinkung

- Verlinke verwandte Komponenten und Setup-Guides
- Nutze aussagekräftige Link-Texte

## Versionierung & Updates

- Größere Änderungen sollten dokumentiert werden
- Alte Informationen nicht löschen, sondern als "veraltet" markieren
- Regelmäßiger Review: mindestens 1x pro Quartal

## Sicherheit & Sensibilität

- **NIEMALS** dokumentieren: WiFi-Passwörter, Home Assistant Token, Private IPs
- Beispiel-Konfigurationen können generisch sein (z.B. `192.168.0.x`)

## Entscheidungslogik

- Bei Fragen immer fragen über:
  - Neue Features/Seiten
  - Struktur-Änderungen
  - Größere Umgestaltungen

