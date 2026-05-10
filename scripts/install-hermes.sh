#!/usr/bin/env bash
set -euo pipefail

# Link active curated skills into Hermes.
# Source of truth stays in this repo; Hermes receives symlinks only.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
HERMES_HOME_DIR="${HERMES_HOME:-$HOME/.hermes}"
DEST="$HERMES_HOME_DIR/skills"
BACKUP_DIR="${SKILLS_BACKUP_DIR:-$HERMES_HOME_DIR/backups/skills-install}"

mkdir -p "$DEST" "$BACKUP_DIR"

echo "Installing active skills for Hermes..."

find \
  "$REPO/skills/core" \
  "$REPO/skills/project" \
  "$REPO/skills/misc" \
  -name SKILL.md \
  -not -path '*/node_modules/*' \
  -print0 |
while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  name="$(basename "$src")"
  target="$DEST/$name"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    backup="$BACKUP_DIR/$name.backup.$(date +%Y%m%d%H%M%S)"
    mv "$target" "$backup"
    echo "  backed up existing $name -> $backup"
  fi

  ln -sfn "$src" "$target"
  echo "  $name -> $src"
done

echo "Done. In an existing Hermes session run /reload-skills, or start a new session."
