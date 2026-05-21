[[Moni's Elektro Base|← Zurück zur Homepage]]
# Datensicherungs-Übersicht

## 🛡️ Sicherungsstrategie

Moni's Elektro Base nutzt ein mehrschichtiges Sicherungssystem:

- **Git-Versionskontrolle** für lokale Backups mit vollständiger Versionshistorie
- [[Git-Versionskontrolle-Setup]] (privat) als Cloud-Backup mit automatischen Pushes
- **Obsidian Vault** lokal auf dem NAS für schnelle Zugriffe
- **Regelmäßige Commits** vor größeren Änderungen oder Veröffentlichungen

Zudem werden alle unsere Rechner von einem separaten [[Backup]] gesichert. Die Software ist das [[Veeam-Backup-Replication]], das unsere Daten auf unser [[NAS Synology DSOBE2023]] sichert. 
Das NAS sichert sich täglich auf einen externen S3 Speicher bei Synology.

Dadurch sind alle Komponenten-Dokumentationen mehrfach geschützt und jederzeit wiederherstellbar. Details dazu finden Sie in unserer [[Aufbau und Struktur]]







---

