# AI Video Editing — Approach Comparison & Recommendation

Comparing the two AI-driven video-editing workflows surfaced across two meetings:

- **Approach A — Claude Code + free tools** — from the [Weekly Group Call, July 8](./weekly-group-call-analysis-2026-07-08.md) (Muhammad Asmal's demo)
- **Approach B — Descript MCP + Underlord** — from the [Descript "integration w Claude" webinar, July 9](./descript-claude-webinar-analysis-2026-07-09.md)

Both produce short-form/social video from raw footage using AI; they differ in engine, cost model, and who can run them.

---

## At a glance

| | **A — Claude Code + free tools** | **B — Descript MCP + Underlord** |
|---|---|---|
| **Engine** | Claude Code orchestrates FFmpeg, Whisper, hyperframes | Claude/ChatGPT MCP → Underlord (Descript's AI editor) |
| **Setup** | Node, Git, CLI, install each tool (hard on Windows) | Click "Connect" in Claude/ChatGPT — ~2 minutes |
| **Editing cost** | LLM tokens only; editing tools are free | LLM tokens **+ Descript AI credits** (plan-gated) |
| **Interface** | Terminal / CLI, no visual editor | Full Descript GUI available to jump in and fine-tune |
| **Lock-in** | None; own the pipeline | Descript ecosystem + subscription |
| **Best at** | Long-form, custom pipelines, cost control at volume | Repeatable branded social clips, non-technical teams |

---

## Approach A — Claude Code + free tools

**Pros**
- **Near-zero marginal cost** — FFmpeg/Whisper/hyperframes are free; you only pay LLM tokens. No per-video credit meter.
- **Total control** — you own the pipeline; anything scriptable is possible (multi-file stitching, the 47→13 min long-form cut Muhammad showed).
- **Model flexibility** — Fable / Opus / Sonnet, plus any model via OpenRouter; drop to Sonnet 5 to slash cost.
- **No ecosystem lock-in or subscription** — nothing gates output but your own token spend.
- Learns your style via saved skills / CLAUDE.md once dialed in.

**Cons**
- **Technical barrier is real** — Node/Git/CLI/tool installs; the group spent meaningful time on Windows install pain. Non-technical users struggle.
- **No visual editor** — fine, frame-level tweaks are awkward; you steer entirely by prompt.
- **More brittle & iteration-heavy** — you assemble the machine; first videos took ~4 passes.
- Top models can **burn tokens fast** (they flagged DeepSeek v4 Pro).
- **Self-support** — you own the debugging.

## Approach B — Descript MCP + Underlord

**Pros**
- **Frictionless, officially supported setup** — works on any plan, even free.
- **Purpose-built editor** — Underlord knows video best-practices and does *media understanding* ("find the clip of the guy drinking water, cut it").
- **GUI escape hatch** — hand off to the Descript app for precise manual edits when the prompt isn't enough.
- **Brand consistency built in** — Brand Studio + layout packs keep every clip on-brand; publish + shareable link/MP4 in one step.
- **Team-friendly & shareable** — packageable skills, a public skill repo, background processing; a non-technical VA can run it.

**Cons**
- **Two cost meters** — LLM tokens *and* Descript AI credits; credits are plan-gated and get expensive at scale.
- **Ecosystem lock-in** + recurring subscription.
- **Less control** — limited to what Underlord/Descript expose; non-deterministic ("vibe, don't replicate exactly").
- Enterprise/IT admins can **block the connector**.

---

## Recommendation

**Lead with Descript MCP (B); keep Claude Code (A) as the scale / margin play.**

For agency work — repeatable **branded** social clips, ideally a workflow a VA or teammate can run without you — **Descript MCP is the right primary path.** It reaches consistent, on-brand output fastest, survives handoff to non-technical people, and its GUI fallback means you're never stuck when a prompt can't nail a fine edit. That reliability and brand consistency is worth the credit cost while establishing the process.

**Switch to / add Claude Code when:**
- **Volume climbs** and Descript AI credits become a real line item — the free-tool pipeline's only cost is tokens (run it on Sonnet 5).
- You need **long-form or unusual edits** (the 47→13 min cut, custom layouts) beyond what Underlord exposes.
- You want to **productize margin** — editing clients' video at scale with no per-video vendor cost.

**Practical sequence**
1. Dial in one great clip style in **Descript MCP** → package it as a skill → run day-to-day production there.
2. In parallel, have the technical side stand up **Muhammad's Claude Code pipeline** as the cost-optimized batch lane once volume justifies the setup.

**Two caveats either way**
- Both still cost **LLM tokens** — model choice is the biggest lever. Default to **Sonnet 5**; escalate to Fable/Opus only when quality demands it.
- Neither yet solves the **EU AI-content labeling** gap (see Nicole's issue in the [July 8 analysis](./weekly-group-call-analysis-2026-07-08.md)).

---

*Prepared from the July 8 Weekly Group Call and the July 9 Descript webinar transcripts.*
