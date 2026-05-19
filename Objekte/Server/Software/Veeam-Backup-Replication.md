[[Moni's Elektro Base|← Zurück zur Homepage]]
# Übersicht

## Funktion

Veeam Backup & Replication ist eine professionelle Backup- und Disaster-Recovery-Lösung für virtuelle, physische und Cloud-Umgebungen. Das Produkt ermöglicht die zuverlässige Sicherung und schnelle Wiederherstellung von Systemen.

![[veeam.webp]]
## Hauptmerkmale

Diese Anwendung sichert alle unseren Komponenten:
- [[Hypervisor Microsoft]]
- [[Hypervisor PVE]]
- 

### Backup-Funktionen
- **Agentlose Backups**: Sicherung von virtuellen Maschinen ohne zusätzliche Software
- **Inkrementelle Sicherung**: Nur Änderungen werden gespeichert (spart Speicherplatz)
- **Mehrfach-Versioning**: Mehrere Backup-Versionen für Punkt-in-Zeit-Wiederherstellung
- **Kompression und Deduplizierung**: Reduzierung des Speicherbedarfs um bis zu 50-90%
- **Encryption**: AES-256 Verschlüsselung für Backup-Sicherheit

### Wiederherstellung
- **Instant VM Recovery**: Schnelle Wiederherstellung von virtuellen Maschinen
- **Datei-Level Recovery**: Selektive Wiederherstellung einzelner Dateien
- **Bare Metal Recovery**: Wiederherstellung kompletter Systeme
- **Granulare Recovery**: Wiederherstellung auf Ebene von Anwendungen (SQL, Exchange, etc.)

### Replication
- **VM Replication**: Automatische Replizierung virtueller Maschinen für Failover
- **Kontinuierliche Replikation**: Echtzeit-Synchronisation mit minimalen RPO-Werten
- **Failover & Failback**: Automatische oder manuelle Umschaltung bei Ausfällen

## Technische Details

- **Unterstützte Hypervisoren**: VMware vSphere, Microsoft Hyper-V, [[Proxmox-PVE]]
- **Backup-Ziele**: NAS, iSCSI, Network-attached Storage, Cloud-Speicher
- **Backup-Fenster**: Flexible zeitliche Planung von Backup-Jobs
- **Verwaltung**: Zentrale Konsole für alle Backup-Operationen

## Verwendung in Moni's Elektro Base

Veeam Backup & Replication sichert alle Rechner des Systems auf das [[NAS]] Speichermedium. Die gesicherten Daten werden täglich automatisch auf einen externen S3-Speicher bei Synology synchronisiert, um eine geografisch verteilte Backup-Strategie (3-2-1 Regel) zu gewährleisten.

## Vorteile

- **Hohe Zuverlässigkeit**: Enterprise-grade Backup-Lösung
- **Schnelle Wiederherstellung**: Minimale Ausfallzeit (RTO/RPO)
- **Skalierbarkeit**: Einfach erweiterbar für wachsende Infrastrukturen
- **Kosteneffizienz**: Intelligente Kompression reduziert Speicherkosten
- **Automatisierung**: Geplante und unbeaufsichtigte Backups
- **Reporting**: Umfangreiche Backup-Berichte und Compliance-Dokumentation

## Best Practices

- **Regelmäßige Backup-Tests**: Monatliche Überprüfung der Wiederherstellbarkeit
- **Mehrschichtiger Schutz**: Kombination mit Cloud-Backups und externen Speichern
- **Backup-Überwachung**: Alerts bei fehlgeschlagenen Backups
- **Aufbewahrungsrichtlinien**: Alte Backups nach definierten Zeiträumen archivieren/löschen
- **Dokumentation**: Klare Dokumentation von Backup-Policies und Wiederherstellungsverfahren
