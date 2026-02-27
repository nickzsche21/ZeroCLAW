#!/usr/bin/env bash
# ZeroClaw installer
# Usage: curl -fsSL https://raw.githubusercontent.com/nickzsche21/ZeroCLAW/main/install.sh | bash

set -e

echo ""
echo " ██████╗███████╗██████╗  ██████╗  ██████╗██╗      █████╗ ██╗    ██╗"
echo "╚══███╔╝██╔════╝██╔══██╗██╔═══██╗██╔════╝██║     ██╔══██╗██║    ██║"
echo "  ███╔╝ █████╗  ██████╔╝██║   ██║██║     ██║     ███████║██║ █╗ ██║"
echo " ███╔╝  ██╔══╝  ██╔══██╗██║   ██║██║     ██║     ██╔══██║██║███╗██║"
echo "███████╗███████╗██║  ██║╚██████╔╝╚██████╗███████╗██║  ██║╚███╔███╔╝"
echo "╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚══════╝╚═╝  ╚═╝ ╚══╝╚══╝"
echo ""
echo " Run OpenClaw with ZERO API cost — powered by AirLLM"
echo " ────────────────────────────────────────────────────"
echo ""

# Check Python
if ! command -v python3 &>/dev/null; then
    echo "❌ Python 3 not found. Please install Python 3.10+"
    exit 1
fi

echo "Installing ZeroClaw from GitHub..."
pip install "git+https://github.com/nickzsche21/ZeroCLAW.git" -q \
    || pip install "git+https://github.com/nickzsche21/ZeroCLAW.git" --break-system-packages -q

echo ""
echo "✅ ZeroClaw installed!"
echo ""

# Auto-patch if OpenClaw exists
if command -v openclaw &>/dev/null; then
    echo "✅ OpenClaw found — patching config..."
    zeroclaw patch
else
    echo "⚠️  OpenClaw not found. Install it first, then run: zeroclaw patch"
fi

echo ""
echo "══════════════════════════════════════════════════"
echo "  DONE! Start ZeroClaw:"
echo "    zeroclaw start"
echo ""
echo "  Then restart OpenClaw:"
echo "    openclaw restart"
echo "══════════════════════════════════════════════════"
echo ""
