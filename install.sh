#!/bin/bash

set -e

WORKSPACE_DIR="workspace"
TARGET_DIR=$(find "$WORKSPACE_DIR" -mindepth 1 -maxdepth 1 -type d | head -n 1)
VITE_CONFIG="$TARGET_DIR/vite.config.js"

if [[ ! -f "$VITE_CONFIG" ]]; then
  echo "❌ vite.config.js not found in $TARGET_DIR"
  exit 1
fi

echo "➡ Found target project directory: $TARGET_DIR"

echo "📦 Backing up existing vite.config.js to vite.config.js.bak"
cp "$VITE_CONFIG" "$VITE_CONFIG.bak"

echo "🛠 Updating vite.config.js with custom config"

cat > "$VITE_CONFIG" << 'EOF'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
  server: {
    allowedHosts: true
  }
})
EOF

echo "✅ vite.config.js has been updated successfully!"

