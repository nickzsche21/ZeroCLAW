#!/usr/bin/env bash
# AirClaw installer
# curl -fsSL https://raw.githubusercontent.com/nickzsche21/airclaw/main/install.sh | bash
set -e

echo ""
echo "    _    _      _____ _               "
echo "   / \\  (_)_ __|  ___| | __ ___      __"
echo "  / _ \\ | | '__| |_  | |/ _\` \\ \\ /\\ / /"
echo " / ___ \\| | |  |  _| | | (_| |\\ V  V / "
echo "/_/   \\_\\_|_|  |_|   |_|\\__,_| \\_/\\_/  "
echo ""
echo " Run OpenClaw with ZERO API cost"
echo " ─────────────────────────────────────"
echo ""

command -v python3 &>/dev/null || { echo "❌ Python 3.10+ required"; exit 1; }

echo "Installing AirClaw..."
pip install airclaw -q || pip install airclaw --break-system-packages -q

echo "Installing backends..."
pip install rabbitllm airllm -q || pip install rabbitllm airllm --break-system-packages -q

echo ""
echo "✅ AirClaw installed!"
echo ""

command -v openclaw &>/dev/null && airclaw patch || echo "⚠️  Install OpenClaw first, then run: airclaw patch"

echo ""
echo "══════════════════════════════════"
echo "  airclaw start    → start server"
echo "  openclaw restart → use it"
echo "══════════════════════════════════"
