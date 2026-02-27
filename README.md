# ZeroClaw ⚡

### Run OpenClaw on ANY GPU with **zero API cost** — powered by AirLLM

> Stop paying $50–$150/month in API bills to power your OpenClaw.  
> One command routes all LLM calls to a local model on your own machine. **Free. Forever. Private.**

---

## Install

```bash
# Option A — from GitHub (recommended until PyPI release)
pip install git+https://github.com/nickzsche21/ZeroCLAW.git

# Option B — one-liner
curl -fsSL https://raw.githubusercontent.com/nickzsche21/ZeroCLAW/main/install.sh | bash
```

---

## Quick Start

```bash
# Step 1 — patch your OpenClaw config (one time)
zeroclaw patch

# Step 2 — start the local LLM server (keep this running)
zeroclaw start

# Step 3 — restart OpenClaw
openclaw restart
```

Done. Your OpenClaw now runs locally. Zero API cost.

---

## Commands

| Command | What it does |
|---------|-------------|
| `zeroclaw start` | Start local LLM server (Mistral 7B default) |
| `zeroclaw start --model 8b` | Start with Llama 3 8B |
| `zeroclaw patch` | Auto-find and patch OpenClaw config |
| `zeroclaw patch --config ~/path/config.json` | Patch specific config |
| `zeroclaw restore` | Restore original config from backup |
| `zeroclaw status` | Check if server is running |
| `zeroclaw install` | Full automated setup in one command |

---

## Models

| Flag | Model | Min VRAM | Speed |
|------|-------|----------|-------|
| `7b` ← default | Mistral-7B-Instruct-v0.2 | 4GB | ⚡⚡⚡ |
| `8b` | Meta-Llama-3-8B-Instruct | 6GB | ⚡⚡⚡ |
| `13b` | Llama-2-13B-chat | 8GB | ⚡⚡ |
| `70b` | Llama-2-70B-chat | 4GB | ⚡ slow |

No GPU? Works on CPU too — just slower. The 7B model is fine on any modern laptop.

Pass any HuggingFace model ID directly:
```bash
zeroclaw start --model mistralai/Mixtral-8x7B-Instruct-v0.1
```

---

## How It Works

```
WhatsApp / Telegram / Discord
         ↓
    OpenClaw
         ↓
   ZeroClaw (localhost:4096)   ← replaces OpenAI/Claude API
         ↓
      AirLLM
         ↓
  Local model on your GPU/CPU
```

ZeroClaw runs an **OpenAI-compatible API server** on localhost. OpenClaw connects to it exactly like it would connect to OpenAI — but everything runs locally via AirLLM's layer-by-layer inference.

---

## Requirements

- Python 3.10+
- OpenClaw installed
- 4GB+ GPU or any CPU (slower)
- 8–15GB disk space for model (downloaded once, cached forever)

---

## Cost Comparison

| Setup | Monthly Cost |
|-------|-------------|
| OpenClaw + OpenAI GPT-4o | $50–$150/mo |
| OpenClaw + Claude | $30–$120/mo |
| **OpenClaw + ZeroClaw** | **$0/mo** |

---

## Status

⚠️ Early release — core functionality working. If something breaks, open an issue and I'll fix it fast.

---

## License

MIT — free to use, modify, sell, whatever.

---

*Star ⭐ if this saved you money.*
