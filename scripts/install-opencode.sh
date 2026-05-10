#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG_DIR="${OPENCODE_CONFIG_DIR:-$HOME/.config/opencode}"
AGENTS_SKILLS_DIR="${AGENTS_SKILLS_DIR:-$HOME/.agents/skills}"
BACKUP_DIR="${SKILLS_BACKUP_DIR:-$HOME/.opencode-backups/skills-install}"

mkdir -p "$CONFIG_DIR/command" "$CONFIG_DIR/agents" "$CONFIG_DIR/skills" "$AGENTS_SKILLS_DIR"
mkdir -p "$BACKUP_DIR"

# Prune old curated OpenCode adapter files that were intentionally debloated.
# Do not delete arbitrary user commands/agents.
for stale in \
  gsd-lite-checker.md \
  gsd-lite-debugger.md \
  gsd-lite-executor.md \
  gsd-lite-mapper.md \
  gsd-lite-pivot-planner.md \
  gsd-lite-planner.md \
  gsd-lite-project-starter.md \
  gsd-lite-reviewer.md \
  gsd-lite-verifier.md; do
  rm -f "$CONFIG_DIR/agents/$stale"
done

echo "Installing OpenCode commands..."
find "$REPO/opencode/command" -maxdepth 1 -type f -name '*.md' -print0 |
while IFS= read -r -d '' command_file; do
  name="$(basename "$command_file")"
  cp "$command_file" "$CONFIG_DIR/command/$name"
  echo "  command/$name"
done

echo "Installing OpenCode agents..."
find "$REPO/opencode/agents" -maxdepth 1 -type f -name '*.md' -print0 |
while IFS= read -r -d '' agent_file; do
  name="$(basename "$agent_file")"
  cp "$agent_file" "$CONFIG_DIR/agents/$name"
  echo "  agents/$name"
done

if [ -f "$REPO/opencode/opencode.json" ]; then
  backup="$CONFIG_DIR/opencode.json.backup.$(date +%Y%m%d%H%M%S)"
  if [ -f "$CONFIG_DIR/opencode.json" ]; then
    cp "$CONFIG_DIR/opencode.json" "$backup"
    echo "Backed up existing opencode.json to $backup"
  fi
  cp "$REPO/opencode/opencode.json" "$CONFIG_DIR/opencode.json"
  echo "  opencode.json"
fi

echo "Linking skills for OpenCode via ~/.agents/skills..."
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
  target="$AGENTS_SKILLS_DIR/$name"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "$BACKUP_DIR/$name.backup.$(date +%Y%m%d%H%M%S)"
  fi

  ln -sfn "$src" "$target"
  echo "  skill/$name -> $src"
done

echo "Done. Restart OpenCode to reload commands and skills."
