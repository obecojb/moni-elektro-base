#!/bin/bash
# Generiert das Inhaltsverzeichnis automatisch aus der Ordnerstruktur
# Wird als Git Pre-Commit Hook ausgeführt

VAULT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOC_FILE="$VAULT_DIR/Inhaltsverzeichnis.md"

# Temporäre Datei für das neue Inhaltsverzeichnis
cat > "$TOC_FILE" << 'HEADER'
[[Moni's Elektro Base|← Zurück zur Homepage]]

# Inhaltsverzeichnis

Alle dokumentierten Komponenten, Systeme und Anleitungen auf einen Blick.
HEADER

# Funktion: Sammle alle .md Dateien eines Ordners und schreibe Links
write_section() {
    local section_title="$1"
    local search_dir="$2"
    local entries=()

    if [ ! -d "$VAULT_DIR/$search_dir" ]; then
        return
    fi

    while IFS= read -r file; do
        # Relativer Pfad ohne .md
        local rel_path="${file#$VAULT_DIR/}"
        local rel_no_ext="${rel_path%.md}"
        # Dateiname als Anzeigename
        local display_name="$(basename "$rel_no_ext")"
        entries+=("- [[$rel_no_ext|$display_name]]")
    done < <(find "$VAULT_DIR/$search_dir" -maxdepth 1 -name "*.md" -type f | sort)

    if [ ${#entries[@]} -gt 0 ]; then
        echo "" >> "$TOC_FILE"
        echo "---" >> "$TOC_FILE"
        echo "" >> "$TOC_FILE"
        echo "## $section_title" >> "$TOC_FILE"
        echo "" >> "$TOC_FILE"
        for entry in "${entries[@]}"; do
            echo "$entry" >> "$TOC_FILE"
        done
    fi
}

# Alle Sektionen generieren
write_section "Hardware" "Funktionen und Geräte/Hardware"
write_section "Software & Dienste" "Funktionen und Geräte/Software"
write_section "Photovoltaik & Energie" "Funktionen und Geräte/Photovoltaik"
write_section "Sensoren & Zigbee" "Funktionen und Geräte/Sensoren"
write_section "Konnektivität & Netzwerk" "Funktionen und Geräte/Sonstige Hardware"
write_section "Datensicherung" "Funktionen und Geräte/Datensicherung"
write_section "Anleitungen" "Anleitungen"

# Footer
cat >> "$TOC_FILE" << 'FOOTER'

---

## Rechtliches

- [[Anleitungen/Impressum|Impressum]]
- [[Anleitungen/Datenschutzerklärung|Datenschutzerklärung]]

---

[[Anleitungen/Impressum|Impressum]] | [[Anleitungen/Datenschutzerklärung|Datenschutz]]
FOOTER

# Zum Staging hinzufügen
git add "$TOC_FILE" 2>/dev/null

echo "✅ Inhaltsverzeichnis aktualisiert"
