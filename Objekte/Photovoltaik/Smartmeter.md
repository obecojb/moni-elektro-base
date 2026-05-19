# Smartmeter (easymeter Q3A)

## Beschreibung

Der easymeter Q3A ist ein intelligenter Stromzähler (Smart Meter) zur genauen Messung und Überwachung des Stromverbrauchs. Er erfasst den Gesamtenergieverbrauch aus dem Stromnetz und liefert Echtzeit-Daten an den Stromlieferanten [[Tibber]], die Steuerung der Stromspeicher [[Marstek Venus 3]] und den [[Home Assistant]] für intelligentes Energiemanagement.

## Hersteller-Informationen

- **Hersteller**: easymeter (Deutschland)
- **Modell**: Q3A
- **Typ**: Intelligenter Stromzähler (Smart Meter)

## Spezifikationen

- **Funktion**: Messung des Netzstrombezugs und -einspeisung
- **Genauigkeit**: Geeicht für Stromtarifabrechnung
- **Schnittstellen**:
  - Modbus TCP/RTU (optional)
  - IR-Lesekopf (Infrarot-Schnittstelle)
  - MBus (Meter Bus) optional
- **Anzeigeformat**: Digitale Anzeige mit LCD-Display
- **Datenerfassung**: Viertelstündliche Verbrauchsdaten

## Funktion

- Erfassung des Gesamtstromverbrauchs des Hauses
- Unterscheidung zwischen Bezug und Einspeisung (bei Stromerzeugung)
- Tarifgestaltung (Doppel-/Mehrfachtarife möglich)
- Fernauslesung via Schnittstelle
- Sicherung gegen Manipulationen (geeicht)

## Integration mit Home Assistant

Der easymeter Q3A wird in [[Home Assistant]] integriert zur:
- **Echtzeit-Verbrauchskontrolle**: Aktueller Stromverbrauch in Watt
- **Energiebilanz**: Gesamtverbrauch und -einspeisung pro Tag/Woche/Monat
- **Tibber Integration**: Kombination mit dynamischen Strompreisen
- **Automatisierungen**: Alerts bei hohem Verbrauch, Lastverschiebung
- **Kostenanalyse**: Verbrauchsanalyse und Kostenprognosen

## Kommunikation

- **IR-Lesekopf**: Optische Datenübertragung ohne Kontakt
- **Netzwerk**: Über optionalen Modbus Converter mit Netzwerk-Anbindung
- **Home Assistant**: Integration via Lesekopf-Adapter oder OBIS-Protokoll
- **Aktuelle Daten**: Verzögerung von wenigen Sekunden bis Minuten

## Rolle im Energiemanagementsystem

Der easymeter Q3A ist zentral für:
1. **Verbrauchsmessung**: Erfasst Gesamtverbrauch des Hauses
2. **Bilanzierung**: Zeigt Netzstrom-Bezug vs. Selbstversorgung
3. **Tibber-Optimierung**: Verbrauchsdaten + Strompreise = optimale Steuerung
4. **Speicher-Decisions**: Bestimmt, ob Netzstrom oder Speicher-Energie genutzt wird

## Datenauslese

- **Halbzeilige Anzeige**: Direktes Ablesen vom Display
- **IR-Lesekopf**: Automatisierte Datenerfassung für Home Assistant
- **Genauigkeit**: Messwerte auf 0,01 kWh genau


---

**Status**: In Betrieb
**Modell**: easymeter Q3A
**Letzte Aktualisierung**: 2026-05-16
**Schnittstelle**: [[Home Assistant]] Integration für Energiemanagement
