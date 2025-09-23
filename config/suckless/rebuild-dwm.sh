#!/usr/bin/env bash
# Script pour rebuilder la configuration DWM/Slstatus

set -e

echo "🔨 Rebuilding NixOS configuration with new DWM theme..."

# Build la configuration
sudo nixos-rebuild switch

echo "✨ Rebuild complete! Your DWM bar should now look much more aesthetic."
echo ""
echo "🎨 Changes applied:"
echo "   • Modern Nord color scheme"
echo "   • Beautiful Nerd Font icons for workspace tags"
echo "   • Improved slstatus with modern icons"
echo "   • Enhanced visual layout"
echo ""
echo "📝 To see the changes, restart your X session or reboot."
echo "💡 Press Mod+Shift+Q to restart DWM if you're currently using it."
