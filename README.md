# ZeroClaw 🦞⚡

### Run OpenClaw on ANY GPU with **zero API cost** — powered by AirLLM

> Stop paying $50–$150/month in OpenAI/Anthropic/DeepSeek API bills just to power your OpenClaw.  
> ZeroClaw routes all LLM calls to a local model on your own GPU. **One command. Forever free.**

---

## The Problem

OpenClaw is incredible — WhatsApp, Telegram, Discord, all your channels, one AI assistant.

But every message costs you API money. Heavy users are paying **$50–$150/month** just in API fees. That's $600–$1,800/year. Permanently.

## The Fix

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/zeroclaw/main/install.sh | bash
```

That's it. ZeroClaw:
1. Installs [AirLLM](https://github.com/lyogavin/airllm) — runs 70B models on a **4GB GPU**
2. Starts a local OpenAI-compatible server on `localhost:4096`
3. Patches your OpenClaw config to use it instead of OpenAI/Claude

**Zero API cost. Runs on your laptop. Private. Forever.**

---

## Quick Start

### Option A: One-liner (recommended)
```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/zeroclaw/main/install.sh | bash
```

### Option B: pip
```bash
pip install zeroclaw
zeroclaw install    # patches OpenClaw config automatically
zeroclaw start      # starts the local LLM server
```

### Option C: Manual
```bash
pip install zeroclaw

# Terminal 1 — start local LLM server
zeroclaw start --model 7b

# Terminal 2 — patch OpenClaw config
zeroclaw patch

# Terminal 3 — restart OpenClaw
openclaw restart
```

---

## Commands

| Command | What it does |
|---------|-------------|
| `zeroclaw start` | Start the local LLM server |
| `zeroclaw start --model 8b` | Start with a specific model |
| `zeroclaw patch` | Patch OpenClaw config to use ZeroClaw |
| `zeroclaw patch --config ~/openclaw/config.json` | Patch a specific config |
| `zeroclaw restore` | Restore original OpenClaw config |
| `zeroclaw status` | Check if server is running |
| `zeroclaw install` | Full automated setup |

---

## Models

| Shorthand | Model | Min VRAM | Speed |
|-----------|-------|----------|-------|
| `7b` | Mistral-7B-Instruct-v0.2 | 4GB | ⚡⚡⚡ Fast |
| `8b` | Meta-Llama-3-8B-Instruct | 6GB | ⚡⚡⚡ Fast |
| `13b` | Llama-2-13B-chat | 8GB | ⚡⚡ Medium |
| `70b` | Llama-2-70B-chat | 4GB | ⚡ Slow (AirLLM magic) |

> **No GPU?** AirLLM can also run on CPU — just slower. The 7B model runs fine on any modern laptop.

You can also pass any HuggingFace model ID directly:
```bash
zeroclaw start --model mistralai/Mixtral-8x7B-Instruct-v0.1
```

---

## How It Works

```
Your Messages (WhatsApp/Telegram/Discord)
         ↓
    OpenClaw Gateway
         ↓
   ZeroClaw Server          ← replaces OpenAI/Anthropic API
   (localhost:4096)
         ↓
      AirLLM
         ↓
   Local LLM Model          ← runs on your own GPU/CPU
   (Mistral/Llama/etc.)
```

ZeroClaw starts an **OpenAI-compatible API server** (`/v1/chat/completions`, `/v1/completions`, `/v1/models`) that OpenClaw connects to just like it would connect to OpenAI — but all inference happens locally.

AirLLM uses **layer-by-layer inference** to run massive 70B models on a 4GB GPU by loading and unloading layers from VRAM to RAM as needed.

---

## Requirements

- Python 3.10+
- OpenClaw installed (`npm install -g openclaw@latest`)
- 4GB+ GPU (NVIDIA recommended) **or** CPU (slower)
- 8–80GB disk space (for model weights, downloaded once)
- RAM: 8GB minimum, 16GB recommended

---

## Pricing Comparison

| Setup | Monthly Cost |
|-------|-------------|
| OpenClaw + OpenAI GPT-4o | $50–$150/mo |
| OpenClaw + Claude Sonnet | $30–$120/mo |
| **OpenClaw + ZeroClaw** | **$0/mo** |

---

## FAQ

**Q: Will it be as smart as GPT-4 / Claude?**  
A: 7B and 8B models are excellent for most tasks — calendar, research, messaging, coding. For very complex reasoning, they're slightly behind GPT-4. Llama 3 70B is close to GPT-4 level.

**Q: What if I don't have a GPU?**  
A: AirLLM works on CPU too. The 7B model responds in 5–30 seconds per message on a modern laptop. Fine for most use cases.

**Q: Is my data private?**  
A: 100%. Nothing leaves your machine. No API keys, no cloud calls.

**Q: Does it work on Windows?**  
A: Yes, via WSL2 (same requirement as OpenClaw).

**Q: What about the AirLLM license?**  
A: AirLLM is Apache 2.0. Models (Llama, Mistral) have their own licenses — check HuggingFace.

---

## Contributing

PRs welcome. Especially interested in:
- Support for more OpenClaw config formats
- Streaming responses
- Quantized model support (GGUF via llama.cpp)
- Windows native support
- Web UI for model management

---

## License

MIT — do whatever you want with it.

---

*Built by someone who was tired of paying API bills.*  
*Star ⭐ if this saved you money.*
