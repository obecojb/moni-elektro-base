[[Moni's Elektro Base|← Zurück zur Homepage]]
# Tibber

## Beschreibung

Tibber ist ein innovativer Stromlieferant mit dynamischen Strompreisen, der stündlich variable Stromtarife anbietet. Dies ermöglicht intelligentes Energiemanagement durch Anpassung des Stromverbrauchs an die Marktpreise.

## Hersteller-Informationen

- **Unternehmen**: Tibber (gegründet 2012, Hauptsitz Schweden)
- **Website**: [https://tibber.com/de](https://invite.tibber.com/o8yx2mj8)
- **Fokus**: Dezentralisierung der Energiewirtschaft, Verbraucherorientierung

## Geschäftsmodell

### Dynamische Strompreisgestaltung

- **Stündliche Preise**: Strompreise ändern sich jede Stunde
- **Marktabhängig**: Preise basieren auf Angebot und Nachfrage im Stromnetz
- **Transparenz**: Preise sind immer 24 Stunden im Voraus bekannt
- **Vorteil**: Möglich, Stromverbrauch in günstige Zeitfenster zu verschieben

### Zusätzliche Dienstleistungen

- **Tibber App**: Echtzeit-Überwachung von Strompreisen und -verbrauch
- **API-Integration**: Offene API für Drittanwendungen (z.B. Home Assistant)
- **Tibber Pulse**: Intelligenter Smart-Meter mit erweiterten Funktionen
- **Community**: Plattform zum Austausch und Optimierungstipps

## Integration mit Home Assistant

Tibber ist zentral in das intelligente Energiemanagementsystem integriert:

### Strompreis-Daten
- **Stündliche Updates**: Aktualisierung der Strompreise für nächste Stunden
- **Prognosen**: Vorhersage teurer und günstiger Zeitfenster
- **API-Integration**: Echtzeit-Datenfluss zu Home Assistant

### Automatisierungen
- **Speicher-Steuerung**: [[Marstek Venus 3]] Laden bei günstigen Preisen
- **Speicher-Entladung**: Entladung bei teuren Preisen statt Netzstrom
- **Lastverschiebung**: Automatische Planung von Verbrauchern in günstige Phasen
- **Alerts**: Benachrichtigungen bei ungewöhnlich hohen Preisen

## Wirtschaftliche Vorteile

### Für Haushalte mit Solaranlage
- **Eigenverbrauchsoptimierung**: Speicherung bei hohem Ertrag und günstigem Preis
- **Entladung bei teuren Zeiten**: Vermeidung von teurem Netzstrom
- **Kostenersparnis**: Drastische Reduktion der Stromkosten durch intelligente Nutzung

## Rolle im Energiemanagementsystem

Tibber ist der zentrale Optimierungsparameter:

1. **[[Balkonkraftwerk]]** erzeugt Strom
2. **Tibber-Preis** bestimmt Speicher-Strategie
3. **[[Marstek Venus 3]]** wird intelligent geladen/entladen
4. **[[Smartmeter]]** (easymeter Q3A) misst Verbrauch und Einspeisung
5. **[[Home Assistant]]** automatisiert alle Entscheidungen

## Technische Integration

### API-Zugang
- **GraphQL-API**: Moderne API für Datenabfrage
- **Authentifizierung**: Token-basierte Authentifizierung
- **Echtzeitdaten**: WebSocket-Unterstützung für Live-Updates
- **Rate Limits**: Großzügige Limits für Private-Use

### Verfügbare Daten
- Aktuelle Strompreise (€/kWh)
- Prognosen für nächste 24 Stunden
- Historische Preisdaten
- Verbrauchsdaten (bei Tibber Pulse)
- Echtzeit-Stromerzeugung (bei PV-Anlage)

## Umweltaspekt

- **Grünstrom**: Tibber bezieht Strom aus erneuerbaren Energiequellen
- **CO₂-Reduktion**: Unterstützung dezentraler Energiewende
- **Verbraucherorientierung**: Förderung bewussten Energieverbrauchs
- **Transparente Daten**: Community-Fokus auf Energiewende

## Kosten

- **Strompreis**: Marktabhängig + kleine Grundgebühr
- **Keine versteckten Gebühren**: Transparente Preisgestaltung
- **Optional Services**: Tibber Pulse und Premium-Features gegen Gebühr

---

**Status**: Aktiver Stromlieferant
**Kontakt**: https://tibber.com/de
**Letzte Aktualisierung**: 2026-05-16
**Zentraler Bestandteil**: Intelligentes Energiemanagement und Kostenoptimierung
