#!/bin/bash
VSCODE_DIR="$HOME/Library/Application Support/Code/User"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

cp "$SCRIPT_DIR/settings.json" "$VSCODE_DIR/settings.json"
cp "$SCRIPT_DIR/keybindings.json" "$VSCODE_DIR/keybindings.json"

while IFS= read -r ext; do
  code --install-extension "$ext"
done < "$SCRIPT_DIR/extensions.txt"

echo "VS Code setup done."
