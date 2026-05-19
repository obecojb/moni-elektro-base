# Backup-Systeme

## Funktion

Ein Backup-System ist eine Sicherheitsstrategie zur Erstellung und Verwaltung von Kopien wichtiger Daten. Es ermöglicht die Wiederherstellung von Informationen im Falle von Datenverlust, Hardwarefehlern, Cyberangriffen oder menschlichen Fehlern. 

Die Backupsoftware ist [[Veeam-Backup-Replication]]

![[sicherungsserver.webp]]
## Grundprinzipien

### 3-2-1 Regel (Best Practice)
Das bewährte Backup-Konzept besteht aus:
- **3 Kopien**: Mindestens 3 Versionen der Daten (Original + 2 Backups)
- **2 verschiedene Medien**: Backups auf unterschiedlichen Speichertechnologien
- **1 externe Kopie**: Mindestens eine Kopie an einem anderen Ort (Cloud, externes Lager)

Diese Regel schützt vor Ausfällen einzelner Komponenten und Speichermedien.

## Backup-Arten

### Nach Umfang
- **Vollsicherung**: Komplette Sicherung aller Daten
- **Inkrementelle Sicherung**: Nur Daten seit letztem Backup
- **Differentielle Sicherung**: Nur Änderungen seit letzter Vollsicherung
- **Spiegelsicherung**: Echtzeit-Kopie aller Daten

### Nach Durchführung
- **Automatische Backups**: Zeitgesteuert und ohne manuelle Intervention
- **Manuelle Backups**: Bewusst durchgeführt nach Bedarf
- **Kontinuierliche Sicherung**: Ständige Überwachung und sofortige Sicherung von Änderungen

## Backup-Strategien

### Zeitbasiert
- **Täglich**: Für kritische Systeme und häufig geänderte Daten
- **Wöchentlich**: Für Standarddaten mit moderaten Änderungen
- **Monatlich**: Für Archiv- und Langzeitdaten
- **Ad-hoc**: Nach größeren Änderungen oder vor kritischen Operationen

### Speicherort
- **Lokal**: Externe Festplatte oder NAS im selben Netzwerk
- **Cloud-basiert**: Offsite-Speicherung (z.B. Google Drive, OneDrive, GitHub)
- **Hybrid**: Kombination aus lokalen und Cloud-Backups

## Wichtige Merkmale

- **Verschlüsselung**: Backups sollten verschlüsselt sein
- **Versionierung**: Mehrere Versionen ermöglichen Zeitpunkt-Wiederherstellung
- **Verfügbarkeit**: Schneller Zugriff auf Backups im Notfall
- **Dokumentation**: Klare Dokumentation von Backup-Prozessen und -Orten
- **Regelmäßige Tests**: Regelmäßige Überprüfung der Backup-Integrität und Wiederherstellbarkeit

## Häufige Fehler

- **Keine Offsite-Backups**: Alle Backups nur lokal führt zu Totalverlust bei Brand/Diebstahl
- **Zu seltene Backups**: Datenverlust zwischen Backup-Intervallen ist unvermeidbar
- **Niemals testen**: Unbewusste Backup-Fehler werden erst bei Notfall entdeckt
- **Unverschlüsselte Backups**: Sensitive Daten sind bei Diebstahl ungeschützt
- **Komplizierte Wiederherstellung**: Der Notfall ist nicht die Zeit, Prozesse zu lernen

## Wiederherstellungs-Planung

- **Recovery Time Objective (RTO)**: Wie schnell müssen Daten verfügbar sein?
- **Recovery Point Objective (RPO)**: Welcher Datenverlust ist akzeptabel?
- **Dokumentation**: Klare Anleitung für Notfallfallwiederherstellung
- **Trockenübung**: Regelmäßige Tests der Wiederherstellungsprozedur

## Monitoring und Wartung

- **Automatische Benachrichtigungen**: Alerts bei Backup-Fehlern
- **Speicherplatz-Verwaltung**: Überwachung verfügbaren Speicherplatzes
- **Datei-Integrität**: Regelmäßige Checksummen-Überprüfung
- **Alte Backups löschen**: Datenschutz durch Archivierung/Löschung nach Aufbewahrungsfrist
