# AirClaw ⚡

### Run OpenClaw on ANY GPU with **zero API cost**

> Stop paying $50–$150/month in API bills.  
> One command → local model on your machine → **$0/month. Forever.**

Supports **RabbitLLM** (newer models: Qwen2.5, DeepSeek, Phi-3) and **AirLLM** as fallback.  
Runs 70B models on a **4GB GPU**. Works on CPU too.

---

## Install

```bash
pip install airclaw
```

Or from GitHub:
```bash
pip install git+https://github.com/nickzsche21/airclaw.git
```

---

## Quick Start

```bash
# Full automated setup (do this first — one time only)
airclaw install

# Then in terminal 1:
airclaw start

# Then in terminal 2:
openclaw restart
```

Done. Your OpenClaw runs locally. Zero API cost.

---

## Commands

| Command | What it does |
|---------|-------------|
| `airclaw install` | Full automated setup |
| `airclaw start` | Start local LLM server (Mistral 7B default) |
| `airclaw start --model qwen` | Start with Qwen2.5 |
| `airclaw start --model deepseek` | Start with DeepSeek |
| `airclaw patch` | Auto-patch OpenClaw config |
| `airclaw patch --config ~/path/config.json` | Patch specific config |
| `airclaw restore` | Restore original config |
| `airclaw status` | Check if server is running |

---

## Models

| Flag | Model | VRAM | Speed |
|------|-------|------|-------|
| `7b` ← default | Mistral-7B-Instruct | 4GB | ⚡⚡⚡ |
| `8b` | Llama-3-8B-Instruct | 6GB | ⚡⚡⚡ |
| `qwen` | Qwen2.5-7B | 4GB | ⚡⚡⚡ |
| `deepseek` | DeepSeek-7B | 4GB | ⚡⚡⚡ |
| `phi` | Phi-3-mini | 4GB | ⚡⚡⚡ fastest |
| `13b` | Llama-2-13B | 8GB | ⚡⚡ |
| `70b` | Llama-2-70B | 4GB | ⚡ slow |

Or pass any HuggingFace model ID:
```bash
airclaw start --model mistralai/Mixtral-8x7B-Instruct-v0.1
```

---

## Backends

AirClaw automatically uses the best available backend:

1. **RabbitLLM** (preferred) — newer models, faster, 4bit compression
2. **AirLLM** (fallback) — battle-tested, wide compatibility

Install both:
```bash
pip install airclaw[all]
```

Or just one:
```bash
pip install airclaw[rabbitllm]
pip install airclaw[airllm]
```

---

## How It Works

```
WhatsApp / Telegram / Discord
         ↓
      OpenClaw
         ↓
  AirClaw (localhost:4096)   ← replaces OpenAI/Claude API
         ↓
  RabbitLLM or AirLLM
         ↓
  Local model on your GPU/CPU
```

AirClaw runs an OpenAI-compatible server on localhost. OpenClaw connects to it exactly like OpenAI — but everything runs on your machine.

---

## Cost

| Setup | Monthly |
|-------|---------|
| OpenClaw + GPT-4o | $50–$150/mo |
| OpenClaw + Claude | $30–$120/mo |
| **OpenClaw + AirClaw** | **$0/mo** |

---

## Requirements

- Python 3.10+
- OpenClaw installed
- 4GB+ GPU (or CPU — slower)
- 8–15GB disk for model weights (downloaded once)

---

## License

MIT — free forever.

*Star ⭐ if this saved you money.*
