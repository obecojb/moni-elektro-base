# Server: pve

Diese Hardware bildet den [[Proxmox-PVE]] ab.

---

## Grundinformationen

| Feld                  | Inhalt        |     |
| --------------------- | ------------- | --- |
| **Servername**        | pve           |     |
| **IP-Adresse**        | 192.168.2.146 |     |
| **Standort**          | Keller rechts |     |
| **Verantwortlicher**  |               |     |
| **Status**            | 🟢 In Betrieb |     |
| **Produktivumgebung** | Ja            |     |

---

### Speicher (RAM)

| Feld                | Inhalt               |
| ------------------- | -------------------- |
| **Gesamtgröße**     | 16 GB                |
| **Typ**             | DDR4 / DDR5 / andere |
| **Geschwindigkeit** | MHz                  |
| **Anzahl Module**   |                      |
| **Slots verfügbar** |                      |

### Speicher (Storage)

#### Systemdatenträger
| Feld | Inhalt |
|---|---|
| **Typ** | SSD / HDD / NVMe |
| **Kapazität** | GB / TB |
| **Schnittstelle** | SATA / NVMe / andere |
| **Modell** | |
| **Zustand** | Neuwertig / Gut / Verschlissen |

#### Zusätzliche Datenträger
| Feld | Inhalt |
|---|---|
| **Typ** | |
| **Kapazität** | |
| **Verwendung** | |
| **Modell** | |

### Netzwerk

| Feld | Inhalt |
|---|---|
| **Netzwerkkarten** | |
| **Geschwindigkeit** | 1GBit / 10GBit |
| **MAC-Adresse** | |
| **VLAN** | |

### Sonstige Hardware

| Feld | Inhalt |
|---|---|
| **Stromversorgung** | W |
| **Redundante PSU** | Ja / Nein |
| **RAID-Controller** | |
| **GPU** | Vorhanden / Keine |
| **Zusätzliche Komponenten** | |

---

## Software

### Betriebssystem

| Feld                     | Inhalt  |
| ------------------------ | ------- |
| **OS**                   | Proxmox |
| **Distribution/Version** | debian  |
| **Kernel-Version**       |         |
| **Installationsdatum**   |         |
| **EOL-Datum**            |         |

### Hypervisor (falls vorhanden)

| Feld            | Inhalt       |
| --------------- | ------------ |
| **Hypervisor**  | [[Proxmox]]  |
| **Version**     |              |
| **VMs laufend** |              |

### Installierte Services/Anwendungen

| Service            | Version | Funktion            |
| ------------------ | ------- | ------------------- |
| [[Home Assistant]] |         | Smart-Home Zentrale |
| [[Tor Snowflake]]  |         | Internetzugang      |
|                    |         |                     |

### Sicherheit

| Feld | Inhalt |
|---|---|
| **Firewall aktiviert** | Ja / Nein |
| **SSH Zugang** | Aktiviert / Deaktiviert |
| **SSH Port** | |
| **Authentifizierung** | Passwort / SSH-Keys / MFA |
| **Selinux/AppArmor** | |
| **Antivirensoftware** | |

---

## Wartung

### Regelmäßige Wartungsaufgaben

| Aufgabe | Häufigkeit | Zuletzt durchgeführt | Nächst fällig |
|---|---|---|---|
| OS-Updates | Monatlich | | |
| Security-Patches | Bei Bedarf | | |
| Hardwarecheck (Logs) | Wöchentlich | | |
| Backup-Überprüfung | Wöchentlich | | |
| Reinigung/Belüftung | Halbjährlich | | |
| Festplattencheck | Monatlich | | |

### Backup & Disaster Recovery

| Feld                               | Inhalt            |
| ---------------------------------- | ----------------- |
| **Backup-Strategie**               | täglich           |
| **Backup-Ziel**                    | NAS               |
| **Backup-Häufigkeit**              |                   |
| **Letzte Sicherung**               |                   |
| **Wiederherstellung getestet**     | Ja / Nein / Datum |
| **RTO (Recovery Time Objective)**  | Minuten           |
| **RPO (Recovery Point Objective)** |                   |

### Incident & Probleme

| Datum | Problem | Lösung | Status |
|---|---|---|---|
| | | | ✅ Gelöst / 🔴 Offen |
| | | | |

---

## Performance & Monitoring

### CPU-Auslastung

| Metrik | Normal | Peak | Schwellwert |
|---|---|---|---|
| **Durchschnitt** | % | % | 80% |
| **Zuletzt gemessen** | | | |

### Speicherauslastung

| Metrik | Normal | Peak | Schwellwert |
|---|---|---|---|
| **Durchschnitt** | % | % | 85% |
| **Zuletzt gemessen** | | | |

### Speicherplatz

| Partition | Größe | Verwendet | Frei | Nutzung % |
|---|---|---|---|---|
| / | | | | |
| /home | | | | |
| | | | | |

### Netzwerk

| Metrik | Wert |
|---|---|
| **Upload/Download Durchschnitt** | Mbps |
| **Bandbreitenauslastung** | % |
| **Letzter Check** | |

---

## Kontakt & Verantwortung

| Feld | Inhalt |
|---|---|
| **Systemadministrator** | |
| **Backup Administrator** | |
| **Notfall-Kontakt** | |
| **Telefon** | |
| **E-Mail** | |

---

## Sicherheit & Compliance

| Feld | Inhalt |
|---|---|
| **Datenschutz-relevant** | Ja / Nein |
| **Compliance** | DSGVO / NIS-2 / andere |
| **Sicherheits-zertifizierung** | |
| **Letzte Sicherheitsprüfung** | |

---

## Notizen & Besonderheiten

_Hier können spezielle Konfigurationen, bekannte Probleme oder Besonderheiten dokumentiert werden._

---

## Upgrade-Planung

| Komponente | Grund | Geplantes Datum | Status |
|---|---|---|---|
| | | | 📋 Geplant / ✅ Durchgeführt |
| | | | |

---

**Stand:** [Datum einfügen]
**Version:** 1.0
**Letzte Überprüfung:** [Datum]
**Nächste Überprüfung:** [Datum]
