#!/bin/bash
# UltimateGrok Skills Restore Script
# Restores backup directly to default Grok paths for immediate use

set -e

BACKUP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ARCHIVE="$BACKUP_DIR/ultimate-grok-skills-full-backup-2026-05-14.tar.gz"

echo "🚀 UltimateGrok Skills Restore"
echo "=============================="
echo "This will restore skills to:"
echo "  - Bundled skills → /root/.grok/skills/"
echo "  - Custom skills  → /home/workdir/.grok/skills/"
echo ""

if [ ! -f "$ARCHIVE" ]; then
    echo "❌ Error: Archive not found at $ARCHIVE"
    exit 1
fi

echo "📦 Extracting bundled skills to /root/.grok/skills/ ..."
sudo mkdir -p /root/.grok/skills
sudo tar -xzf "$ARCHIVE" --strip-components=1 -C /root/.grok/skills bundled-skills/

echo "📦 Extracting custom skills to /home/workdir/.grok/skills/ ..."
mkdir -p /home/workdir/.grok/skills
tar -xzf "$ARCHIVE" --strip-components=1 -C /home/workdir/.grok/skills custom-skills/

echo ""
echo "✅ Restore complete!"
echo ""
echo "Skills are now ready at:"
echo "  /root/.grok/skills/     (bundled)"
echo "  /home/workdir/.grok/skills/ (custom)"
echo ""
echo "You can now use all UltimateGrok skills immediately."