#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="$SCRIPT_DIR/dist"
ARCHIVE="$DIST_DIR/yahoo-mail-right-ad-remover.zip"

validate() {
  node --check "$SCRIPT_DIR/content.js"
  node --input-type=module --eval "JSON.parse(await (await import('node:fs/promises')).readFile('$SCRIPT_DIR/manifest.json', 'utf8'))"
  test -f "$SCRIPT_DIR/styles.css"
  echo "Validation passed."
}

build() {
  validate
  mkdir -p "$DIST_DIR"
  rm -f "$ARCHIVE"
  (
    cd "$SCRIPT_DIR"
    zip -q -j "$ARCHIVE" manifest.json styles.css content.js
  )
  echo "Built $ARCHIVE"
}

show_deploy_steps() {
  cat <<'EOF'
Chrome deployment steps:
1. Open chrome://extensions
2. Enable Developer mode.
3. Select Load unpacked.
4. Choose this extension directory.
EOF
}

while true; do
  cat <<'EOF'

Yahoo Mail Right Ad Remover
1) Validate extension files
2) Build ZIP package
3) Show Chrome deployment steps
4) Exit
EOF
  read -r -p 'Choose an option: ' choice

  case "$choice" in
    1) validate ;;
    2) build ;;
    3) show_deploy_steps ;;
    4) exit 0 ;;
    *) echo "Invalid option. Please choose 1-4." ;;
  esac
done
