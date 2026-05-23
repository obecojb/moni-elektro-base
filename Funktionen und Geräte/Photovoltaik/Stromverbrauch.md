[[Moni's Elektro Base|← Zurück zur Homepage]]
# Stromverbrauch und Energiemanagement

## Überblick

Das Energiemanagementsystem optimiert den Stromverbrauch im Haus durch das intelligente Zusammenspiel von:
- Lokaler Stromerzeugung ([[Balkonkraftwerk]])
- Energiespeicherung ([[Marstek Venus 3]])
- Verbrauchsmessung ([[Smartmeter]] / [[Marstek CT002]])
- Dynamischen Strompreisen ([[Tibber]])
- [[Home Assistant]] Automatisierungen

## Komponenten und ihre Rollen

### 1. Stromerzeugung: [[Balkonkraftwerk]]

Das Balkonkraftwerk auf dem Garagendach produziert Solarstrom (1600W):
- **Erzeugung**: Abhängig von Tageszeit und Wetter
- **Priorisierung**: Direkter Eigenverbrauch vor Speicherung
- **Überschuss**: Wird in [[Marstek Venus 3]] Speichern eingelagert

### 2. Energiespeicherung: [[Marstek Venus 3]]

Drei Stromspeicher-Module speichern überschüssige Solarenergie:
- **Kapazität**: 15 KW brutto, 13 KW netto bei einem durchschnittlichen Tagesverbrauch von 10KW
- **Aufgabe**: Speichert Energie für Verbrauch außerhalb von Sonnenstunden
- **Intelligente Steuerung**: Lade- und Entladeoptimierung basierend auf Strompreisen
- **Monitoring**: [[Marstek CT002]] Sensoren erfassen Energieflüsse

### 3. Verbrauchsmessung

#### Smartmeter
- Erfasst den Gesamtstromverbrauch aus dem Netzwerk
- Liefert Echtzeit-Verbrauchsdaten an [[Home Assistant]]
- Ermöglicht genaue Bilanzierung von Erzeugung, Speicherung und Verbrauch

#### [[Marstek CT002]] Stromwandler
- Messen Energieflüsse zwischen Balkonkraftwerk, Speichern und Hausanlage
- Ermöglichen präzises Tracking einzelner Energieflüsse
- Unterstützen optimale Lastverteilung

### 4. Dynamische Strompreise: [[Tibber]]

Tibber bietet stündlich variable Strompreise:
- **Preisinformationen**: Aktuelle und prognostizierte Preise für nächste Stunden
- **Integration**: Daten fließen in [[Home Assistant]] für automatisierte Entscheidungen
- **Optimierung**: Speicher werden bei günstigen Preisen geladen, bei teuren Preisen entladen

## Zusammenspiel und Optimierungslogik

### Szenario 1: Sonniger Tag mit hoher Erzeugung

1. [[Balkonkraftwerk]] erzeugt Strom
2. Eigenverbrauch im Haus wird direkt versorgt
3. Überschüsse werden in [[Marstek Venus 3]] geladen
4. Bei voller Speicherung: Überschuss ins Netzwerk einspeisen

### Szenario 2: Bewölkter Tag oder Nacht

1. [[Marstek Venus 3]] speist bei günstigem Tibber-Preis Energie ein
2. Zu teuren Zeiten: Sparen und Speicher sparen
3. Smartmeter und CT002 optimieren Energiefluss
4. [[Home Assistant]] automatisiert Entladung basierend auf Preis und Verbrauch

### Szenario 3: Hoher Strompreis

1. System nutzt gespeicherte Solarenergie statt Netzstrom
2. Nicht-essenzielle Lasten werden verschoben
3. Kostenersparnis durch Eigenverbrauch statt Netzstrombezug
4. [[Tibber]] Integration ermöglicht intelligente Planung

## Kosten- und CO₂-Optimierung

Das integrierte System zielt auf:
- **Kostenreduktion**: Minimierung des teuren Netzstrombezugs
- **Eigenverbrauchsmaximierung**: Nutzung der eigenen Solarproduktion
- **CO₂-Reduktion**: Reduktion des Stromnetzbezugs = weniger fossile Energieträger
- **Wirtschaftlichkeit**: Amortisation der Investition durch Stromkostenersparnis

## Metriken und Überwachung

Folgende Metriken werden in [[Home Assistant]] überwacht:
- Aktuelle Solarproduktion (W)
- Speicher-Ladestatus (%)
- Stromverbrauch (W)
- Netzstromdifferenz (Bezug/Einspeisung)
- Tibber Strompreis (€/kWh)
- Tägliche/wöchentliche Bilanzen

---

**Status**: In Betrieb
**Letzte Aktualisierung**: 2026-05-16
**Ziel**: Maximale Kostenersparnis und CO₂-Reduktion durch intelligentes Energiemanagement

---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
