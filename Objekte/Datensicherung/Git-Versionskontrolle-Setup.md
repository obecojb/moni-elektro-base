[[Moni's Elektro Base|← Zurück zur Homepage]]
# Git-Versionskontrolle & GitHub-Backup

Vollständige Dokumentation des Git-Setups für Moni's Elektro Base Vault.

## 📋 Übersicht

Das Vault wird mit **Github** versioniert und automatisch auf **GitHub** gesichert. Dies ermöglicht:
- 📜 Vollständige Versionshistorie
- 💾 Automatische Cloud-Backups
- 🔄 Änderungen nachverfolgbar
- ⚙️ Automatische Pushes zu GitHub

## 🔧 Setup (bereits durchgeführt)

### Initialisierung
```bash
git init
git config --global user.email "monika@elektro-base.local"
git config --global user.name "Monika"
```

### GitHub-Verbindung
```bash
git remote add origin https://github.com/obecojb/moni-elektro-base.git
git branch -M main
git push -u origin main
```

### Automatisierung mit Git Hooks
- **Pre-Commit Hook:** Akzeptiert Commits
- **Post-Commit Hook:** Pushed automatisch zu GitHub

**Dateien:**
```
.git/hooks/pre-commit
.git/hooks/post-commit
```

## 🚀 Tägliche Nutzung

### Neuen Backup erstellen
```bash
cd "O:/Privat/Monika/Haus/Moni's Elektro Base/Moni's  Elektro Base"
git add .
git commit -m "Backup: [Beschreibung der Änderungen]"
```

**Der Hook macht automatisch:**
```
📤 Hochladen zu GitHub...
✅ GitHub aktualisiert!
```

### Verlauf anschauen
```bash
git log --oneline        # Alle Commits anzeigen
git status               # Aktuelle Änderungen
git diff                 # Detaillierte Änderungen
```

## 📝 Good Practices für Commit-Messages

**Gutes Format:**
```
git commit -m "Backup: Neue Komponenten dokumentiert"
git commit -m "Fix: Rechtschreibfehler in Home Assistant.md"
git commit -m "Update: CLAUDE.md mit neuen Richtlinien"
git commit -m "Add: README.md erstellt"
```

**Schlechte Beispiele:**
```
git commit -m "Update"           # Zu vage
git commit -m "asdf"             # Sinnlos
git commit -m "Fix bugs"         # Zu allgemein
```

## 🔐 Sicherheit & .gitignore

### Ausgeschlossene Dateien
Die `.gitignore` schließt automatisch aus:
- ❌ `.claude/` – Claude Code Einstellungen
- ❌ `.claudian/` – Claude Sessionen
- ❌ `.obsidian/workspace.json` – Temporäre Workspace-Daten
- ❌ `.trash/` – Gelöschte Dateien
- ❌ `.env` Dateien – Sensible Daten
- ❌ `secrets.md` – Passwörter, Tokens

### Sensible Daten NIEMALS dokumentieren:
- ❌ WiFi-Passwörter
- ❌ Home Assistant Token
- ❌ Private IP-Adressen
- ❌ API-Keys

## 🐛 Troubleshooting

### Problem: `fatal: cannot lock ref 'HEAD'`
**Lösung:**
```bash
rm -f .git/index.lock
git status
```

### Problem: `remote origin already exists`
**Lösung:**
```bash
git remote remove origin
git remote add origin https://github.com/obecojb/moni-elektro-base.git
```

### Problem: `fatal: Authentication failed`
**Lösung:**
- GitHub Personal Access Token verwenden statt Passwort
- Token in GitHub Settings erstellen: https://github.com/settings/tokens

### Problem: Hook wird nicht ausgeführt
**Lösung:**
```bash
chmod +x .git/hooks/pre-commit
chmod +x .git/hooks/post-commit
```

## 📊 Repository-Struktur

```
.git/                           ← Git-Datenbank
├── objects/                    ← Komprimierte Dateien
├── refs/                       ← Branch-Informationen
├── hooks/                      ← Automatisierte Scripts
│   ├── pre-commit             ← Vor jedem Commit
│   └── post-commit            ← Nach jedem Commit
└── config                      ← Git-Konfiguration

.gitignore                       ← Regeln für Ausschlüsse
README.md                        ← GitHub-Beschreibung
```

## 🌐 GitHub-Links

- **Repository:** https://github.com/obecojb/moni-elektro-base
- **Commits:** https://github.com/obecojb/moni-elektro-base/commits/main
- **Einstellungen:** https://github.com/obecojb/moni-elektro-base/settings

## 📚 Weitere Ressourcen

- Git Dokumentation: https://git-scm.com/doc
- GitHub Docs: https://docs.github.com
- Git-Hooks: https://git-scm.com/book/de/v2/Git-Internals-Git-Hooks

## ✅ Checkliste

- [x] Git Repository initialisiert
- [x] GitHub-Konto verbunden
- [x] .gitignore konfiguriert
- [x] Git Hooks installiert
- [x] README.md erstellt
- [x] Erstes Backup durchgeführt
- [x] Auto-Push funktioniert

---

**Zuletzt aktualisiert:** 2026-05-18
**Status:** ✅ Aktiv und automatisiert
