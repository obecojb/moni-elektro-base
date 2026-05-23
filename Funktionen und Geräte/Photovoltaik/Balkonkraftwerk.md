[[Moni's Elektro Base|← Zurück zur Homepage]]

# Balkonkraftwerk

![[PV2.webp]]

---

## Übersicht

Unser Balkonkraftwerk ist eine intelligente Mini-Solaranlage, die auf dem südwärts ausgerichteten Garagendach installiert ist. Das System erzeugt eigenverantwortlich Solarstrom und speist diesen intelligent in unser Stromnetz ein – mit automatischer Optimierung je nach aktuellem Stromverbrauch und Speicherkapazität.

![[balkonkraftwerk.webp|Balkonkraftwerk Übersicht]]
## Funktionsweise

Das Balkonkraftwerk arbeitet nach folgendem Prinzip:

1. **Stromerzeugung**: Die Solarmodule produzieren Gleichstrom aus Sonnenlicht
2. **Wechselrichtung**: Der [[Hoymiles HMS-1600-4t|Wechselrichter]] wandelt diesen in Netzstrom um
3. **Überwachung**: Der [[Marstek CT002]] (Current Transformer) misst den aktuellen Stromfluss
4. **Intelligente Verteilung** durch den [[Marstek Venus 3]]:
   - Erzeugter Solarstrom wird zunächst für den aktuellen Hausverbrauch genutzt
   - Überschüssige Energie wird in die [[Stromspeicher]] gespeichert
   - Bei günstigen Strompreisen (via [[Tibber]]) können die Speicher nachgeladen werden
5. **Monitoring**: Der [[Smartmeter]] trackt alle Verbrauchsdaten im Echtzeit-Dashboard

## Hardware-Konfiguration

| Komponente | Modell | Funktion |
|---|---|---|
| **Solarmodule** | 4x 400W | Stromerzeugung |
| **Wechselrichter** | [[Hoymiles HMS-1600-4t]] | DC → AC Umwandlung |
| **Strommesser** | [[Marstek CT002]] | Stromfluss-Messung |
| **Regelgerät** | [[Marstek Venus 3]] (3x) | Intelligente Verteilung |
| **Speicher** | LiFePO₄-Batterien | Pufferung für Netzeinspeisung |

## Überwachung & Monitoring

### Home Assistant Integration

Das System wird über [[Home Assistant]] vollständig überwacht:
- **Echtzeit-Dashboard**: Live-Stromerzeugung und -verbrauch
- **Tagesstatistiken**: Ertrag, Einspeisung, Speicherzyklus
- **Langzeit-Analysen**: Monatliche und jährliche Trends
- **Automatisierungen**: Zeitgesteuerte Speicher-Ladevorgänge
- **Wetter-Prognosen**: Erwartete Erzeugung basierend auf Wettervorhersage

### Monitoring-Systeme

- [[Smartmeter]]: Messung des Hausverbrauchs
- [[Marstek CT002]]: Strommessung aus der Solaranlage
- [[OpenDTU]]: Lokales Monitoring des Wechselrichters

## Wartung & Betrieb

### Wartungsplan

- **Monatlich**: Visuelle Kontrolle auf Verschmutzung oder Beschädigungen
- **Halbjährlich**: Kontrolle aller Anschlüsse und Stecker
- **Jährlich**:
  - Firmware-Updates einspielen
  - Speicher-Kalibrierung durchführen
  - Messdaten prüfen und archivieren

### Reinigung

- Solarmodule bei starker Verschmutzung mit destilliertem Wasser und weichem Tuch reinigen
- Keine aggressiven Reinigungsmittel verwenden
- Idealerweise morgens oder abends reinigen (nicht bei direckter Sonneneinstrahlung)

### Fehlerbehebung

**Problem**: Keine Stromerzeugung
- Prüfe: Sonnenschein, Anschlüsse, LED-Status am Wechselrichter

**Problem**: Niedrigere Erträge als erwartet
- Überprüfe: Verschmutzung, Schatten, Firmware-Version, Speicher-Status

**Problem**: Speicher lädt nicht
- Kontrolliere: [[Marstek Venus 3]] Einstellungen, [[Tibber]]-Tarife, Stromfluss-Richtung

---

## Weiterführende Komponenten

- [[Hoymiles HMS-1600-4t]]: Detaillierte Wechselrichter-Dokumentation
- [[OpenDTU]]: Lokales Cloud-freies Monitoring
- [[Tibber]]: Strompreis-Integration für automatische Optimierung
- [[Smartmeter]]: Verbrauchsmessung und Analyse

---

**Status**: 🟢 Aktiv und optimiert
**Letzte Aktualisierung**: 2026-05-20

---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
