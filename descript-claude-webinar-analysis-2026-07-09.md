# "Descript integration w Claude" — Webinar Analysis

**Date:** July 9, 2026, ~2:03 PM CT
**Duration:** ~58 minutes
**Captured by:** Carlos (carlosboyd@gmail.com) via Fireflies
**Source:** Fireflies transcript (`01KX447MG6D1MFCSXZZ1DY0SGV`)

**Related documents:**
- [Weekly Group Call — Full Meeting Analysis (July 8)](./weekly-group-call-analysis-2026-07-08.md)
- [Video Editing Approach Comparison](./video-editing-approach-comparison.md)

---

## What it is

A **Descript-hosted webinar**, not an internal team call. Two Descript staff present:

- **Speaker 1 = Sam** (host / PM) — walks through the workflow and demo
- **Speaker 2 = Teddy** (Descript, works on Underlord features) — handles connection setup and fields chat Q&A

Fireflies labeled the speakers generically ("Speaker 1/2") because it wasn't a native calendar meeting. The transcript contains ASR garbles worth decoding: "Plaud / Plaad / blog / VOD" all = **Claude**; "VScript / Descripts" = **Descript**; "Mara / Laura / Lauren" = **Lara** (Descript's CEO); "skill / stage" are used interchangeably.

---

## Core message

Descript is now **summonable from inside Claude and ChatGPT via MCP** (Model Context Protocol). Instead of going *to* Descript to edit, Descript comes *to* your AI workspace — so you can make and edit videos without leaving a Claude/ChatGPT chat, using all the context (skills, connectors, docs) already there.

**Two usage modes:** *Access* (run Descript from your AI tool, in the background) and *Automation* (trigger workflows on events — deferred to the next webinar).

## Architecture

- The **MCP is a bridge**; the real editor behind it is **Underlord**, Descript's in-app AI video editor. Claude/ChatGPT are generalist brains; **Underlord is the specialist** that knows what makes a good video (when to cut, apply Studio Sound, reshape B-roll to portrait, etc.).
- **Three MCP tools:** (1) **Import** media (upload, or from a URL / Google Drive / Dropbox), (2) **Publish** (generate a share page / MP4 download), (3) the **agent/edit tool** — *all edits go through prompts to Underlord*. There are no discrete "trim/caption" buttons; you describe the edit in natural language and Underlord executes.
- Underlord does **media understanding** — it "watches" the footage, so you can say "find the clip of the guy drinking water and remove it" and it locates it visually.

## The demo workflow

Real use case: CEO Lara does many podcast interviews; they want repeatable, brand-aligned social clips.

1. **Connect** Descript in Claude (Customize → Connectors → browse → Descript → Allow) or ChatGPT (Plugins → install). Same steps work in the Claude desktop app.
2. **Import** the raw recording into Claude, prompt for a clip (e.g. *"one 60-sec clip, 1:1, find the most provocative/daring moments"*).
3. **Refine in a loop:** watch the result → note fixes (captions, music, B-roll, intro title card) → resubmit → repeat. Sam dictates critiques by voice into Claude, with Descript open in a second window.
4. **Skillify:** once happy, ask Claude to *"take all the cumulative edits and write a skill."* Save it under Claude → Customize → Skills.
5. **Reuse:** `/create-clips` + upload a new recording → the whole style reproduces in one shot. The next webinar automates this to fire on every new recording landing in a folder.

## Cost model (asked repeatedly in chat)

- Two meters: **Claude/ChatGPT tokens** (LLM thinking) + **Descript AI credits** (when Underlord actually does work). API-driven edits show an "API" tag in the usage panel.
- **No separate MCP billing** — works on any plan, even free; the plan just gates how much you can produce. MCP itself adds no extra cost.
- **Biggest cost lever = the model.** Sam defaulted to **Opus 4.8**; you can point Claude at a cheaper model (e.g. Sonnet) *and independently* tell Underlord to use a stronger one (e.g. "Underlord, use Fable 5") — routing brainpower where it matters.

## Notable pro tips

- **"Vibe in a direction" rather than pixel-exact replication** — AI is non-deterministic; lean on **Brand Studio / layout packs** for consistency.
- **Don't rush the first good version** — "if you replicate mediocrity, you replicate mediocrity." The manual polish you do once pays dividends every time the skill runs.
- **File too big for Claude/ChatGPT upload?** Import from Google Drive/Dropbox or a URL, or use media already in Descript.
- Descript maintains a **public repository of shareable skills** you can use or contribute to.
- Best skills are **very specific** — they handle varied inputs but still land close to your desired output.

---

## How this connects to the July 8 group call

This is essentially the "official" version of what Muhammad demoed. He does end-to-end editing in **Claude Code** with free tools (FFmpeg / Whisper / hyperframes); this webinar shows Descript's own sanctioned **MCP** path (Claude/ChatGPT → Underlord). Same "record raw → prompt-edit → package as reusable skill" pattern, different engine. See the [approach comparison](./video-editing-approach-comparison.md) for the full trade-off.

---

*Prepared from the full Fireflies transcript. The webinar is ~58 minutes; ASR speaker labels and garbled brand names were decoded during analysis.*
