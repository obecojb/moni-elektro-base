#!/bin/bash

HOMEPAGE_LINK="[[Moni's Elektro Base|← Zurück zur Homepage]]"

# Alle .md Dateien außer der Homepage
find Objekte Anleitungen -name "*.md" -type f | while read file; do
  if [[ "$file" != *"Moni's Elektro Base.md"* ]]; then
    # Prüfe ob der Link bereits existiert
    if ! head -1 "$file" | grep -q "Zurück zur Homepage"; then
      # Füge den Link am Anfang hinzu
      echo "$HOMEPAGE_LINK" | cat - "$file" > "$file.tmp" && mv "$file.tmp" "$file"
      echo "✅ Link hinzugefügt: $file"
    else
      echo "⏭️ Link existiert bereits: $file"
    fi
  fi
done
