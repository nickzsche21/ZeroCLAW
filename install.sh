#!/usr/bin/env bash
# ZeroClaw Installer — Run OpenClaw with zero API cost
# Usage: curl -fsSL https://raw.githubusercontent.com/yourusername/zeroclaw/main/install.sh | bash

set -e

BOLD="\033[1m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
RESET="\033[0m"

echo ""
echo -e "${BOLD}${CYAN}"
echo " ██████╗███████╗██████╗  ██████╗  ██████╗██╗      █████╗ ██╗    ██╗"
echo "╚══███╔╝██╔════╝██╔══██╗██╔═══██╗██╔════╝██║     ██╔══██╗██║    ██║"
echo "  ███╔╝ █████╗  ██████╔╝██║   ██║██║     ██║     ███████║██║ █╗ ██║"
echo " ███╔╝  ██╔══╝  ██╔══██╗██║   ██║██║     ██║     ██╔══██║██║███╗██║"
echo "███████╗███████╗██║  ██║╚██████╔╝╚██████╗███████╗██║  ██║╚███╔███╔╝"
echo "╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚══════╝╚═╝  ╚═╝ ╚══╝╚══╝"
echo -e "${RESET}"
echo -e "${BOLD} Run OpenClaw with ZERO API cost — powered by AirLLM${RESET}"
echo -e " ─────────────────────────────────────────────────────"
echo ""

# ── Check Python ───────────────────────────────────────────────────────────────
if ! command -v python3 &>/dev/null; then
    echo -e "${YELLOW}[ZeroClaw] Python 3 not found. Please install Python 3.10+${RESET}"
    exit 1
fi

PY_VERSION=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
echo -e "${GREEN}[ZeroClaw] ✅ Python ${PY_VERSION} found${RESET}"

# ── Check pip ─────────────────────────────────────────────────────────────────
if ! command -v pip3 &>/dev/null && ! command -v pip &>/dev/null; then
    echo -e "${YELLOW}[ZeroClaw] pip not found. Installing...${RESET}"
    python3 -m ensurepip --upgrade
fi

PIP="pip3"
command -v pip3 &>/dev/null || PIP="pip"

# ── Install ZeroClaw ──────────────────────────────────────────────────────────
echo -e "${CYAN}[ZeroClaw] Installing ZeroClaw...${RESET}"
$PIP install zeroclaw --upgrade -q

echo -e "${GREEN}[ZeroClaw] ✅ ZeroClaw installed!${RESET}"

# ── Check OpenClaw ────────────────────────────────────────────────────────────
if command -v openclaw &>/dev/null; then
    echo -e "${GREEN}[ZeroClaw] ✅ OpenClaw found!${RESET}"
    echo ""
    echo -e "${CYAN}[ZeroClaw] Patching OpenClaw config to use local LLM...${RESET}"
    zeroclaw patch
else
    echo -e "${YELLOW}[ZeroClaw] ⚠️  OpenClaw not found on PATH.${RESET}"
    echo -e "           Install it first: ${BOLD}npm install -g openclaw@latest${RESET}"
    echo -e "           Then run:         ${BOLD}zeroclaw patch${RESET}"
fi

echo ""
echo -e "${BOLD}${GREEN}═══════════════════════════════════════════════════${RESET}"
echo -e "${BOLD}${GREEN}  🎉 ZeroClaw installed successfully!${RESET}"
echo -e "${BOLD}${GREEN}═══════════════════════════════════════════════════${RESET}"
echo ""
echo -e "  ${BOLD}QUICK START:${RESET}"
echo -e "  ─────────────────────────────────────────────────"
echo -e "  1. Start ZeroClaw server (terminal 1):"
echo -e "     ${CYAN}zeroclaw start${RESET}"
echo ""
echo -e "  2. Restart OpenClaw (terminal 2):"
echo -e "     ${CYAN}openclaw restart${RESET}"
echo ""
echo -e "  3. Message your OpenClaw on WhatsApp/Telegram."
echo -e "     It now runs locally. Zero API cost. Forever."
echo -e "  ─────────────────────────────────────────────────"
echo ""
echo -e "  ${BOLD}MODELS (pass to zeroclaw start --model):${RESET}"
echo -e "    ${CYAN}7b${RESET}  → Mistral 7B  (4GB GPU, fastest, recommended)"
echo -e "    ${CYAN}8b${RESET}  → Llama 3 8B  (6GB GPU)"
echo -e "    ${CYAN}13b${RESET} → Llama 2 13B (8GB GPU)"
echo -e "    ${CYAN}70b${RESET} → Llama 2 70B (4GB GPU, very slow)"
echo ""
echo -e "  ${BOLD}HELP:${RESET} zeroclaw --help"
echo ""
