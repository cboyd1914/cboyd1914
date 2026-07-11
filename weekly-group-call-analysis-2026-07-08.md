# Weekly Group Call — Full Meeting Analysis

**Date:** July 8, 2026, 9:00 AM CT
**Duration:** ~95 minutes
**Host:** Muhammad Asmal (Asmal Digital, based in Dubai)
**Format:** Zoom group coaching call for his agency / AI community (Agency OS users)
**Source:** Fireflies full transcript (`01KWDFQ59RZTB2AHEWK6P49MKB`)

**Speakers on record:** Muhammad Asmal, Frankie Barwell, Riyaz (Zanor Digital), Suzanne (Ladybug House), Nicole, Eduard Brancoveanu, Michael ("CADDY AI"), Wale A, plus a "Zoom user."

> **Note on Carlos:** Carlos is on the invite list but was **not on this call**. At roughly the 45-minute mark Muhammad says, *"Carlos is not on here today, but he was testing Blotato as well. I wonder how it's working out for him."* This meeting is one Carlos was invited to but missed — there is nothing he personally said to analyze.

> **Why this write-up exists:** the Otter export only captured the first ~26 minutes. Fireflies has the full ~95-minute recording, and the most substantive material (video editing, publishing, compliance, security, and the AI-and-jobs discussion) is in the ~69 minutes Otter missed.

---

## Part 1 — What Otter captured (first ~26 min)

- **Frankie Barwell's app:** built solo in ~2 months using Emergent + Claude, trademarked, de-risked from any single platform, benchmarked against Housecall Pro / Jobber. (Later revealed: Frankie was a 20-year IT developer/contractor — Intel, IBM — which reframes the achievement.)
- **Model landscape:** Fable 5's free window extended to ~July 12 (Muhammad's theory: to preempt a rumored GPT-5.6 release). Consensus that **Sonnet 5** is now good enough for most day-to-day work and far cheaper — teams keep staff on Sonnet 5 and reserve Opus 4.8 / Fable for leadership and planning.
- **Core philosophy:** *"We're moving away from a world of prompting into a world of orchestration and instruction."* Models now self-prompt better than humans can. The framework: give any AI **Memory** (brand DNA / who you are) + **Skills** (SOPs) + **Tools** — the same way you would onboard a human hire. Suzanne reinforced this: *"don't tell it — it knows; just tell it what you need."*

---

## Part 2 — The extra ~69 minutes (the part that matters)

### 1. Video editing entirely inside Claude Code — the headline demo
- Muhammad now uses **Claude Code as his full video editor**, end to end. He fed it **raw 47.5-minute footage** (talking-head + screen share, gaps and all) and it produced a finished **13:20 edited video**, plus generated the thumbnail.
- **Workflow:** records in **Descript** (which outputs separate camera + screen files) → Claude Code stitches them, cuts dead air, adds zoom-in/zoom-out callouts, and lays out side-by-side screen + presenter.
- **It "learns" his style:** the first 2 videos took ~4 iterations of back-and-forth; once he locked the style, videos 5–8 needed only **one pass each**.
- **Zero paid editing tools** — it orchestrates free ones: **Whisper** (audio/transcription), **FFmpeg** (cropping/layout), **hyperframes** (callout animations). He asks Claude to install whatever it needs.
- **Cost/model note:** used Fable 5 for quality, but says **Sonnet 5 handles it fine** at roughly "100% less" token cost. Confirmed it also works from **audio-only** input (relevant to Suzanne).
- Same technique produced the **animated app-demo videos** for Frankie — done in Claude Code, not HeyGen (tested on both Fable 5 and Opus 4.8).

### 2. Auto-publishing to social
- Muhammad is testing **Blotato** (he discovered he already had a free creator account) connected to Claude Code → posts to Twitter, YouTube, LinkedIn, Facebook, Instagram, and TikTok.
- **Key finding:** the **GoHighLevel (GHL) MCP** already has a full social-posting toolset (create/schedule to FB, IG, LinkedIn, X, Google My Business, TikTok) — so GHL users **don't need to pay for Blotato**. Trade-off: Blotato is stronger for **YouTube titles/thumbnails and fine-grained platform controls** (e.g. TikTok privacy flags); GHL lacks those.
- Riyaz and the nonprofit "Zoom user" both confirmed scheduling a full month/year of posts via Claude → GHL.

### 3. AI-content labeling — a real compliance gap (Nicole's issue)
- **Germany/EU requires an "AI-generated" label from Aug 2, 2026.** Nicole can't use the Instagram mobile app (accessibility needs + EU screen-mirroring block) so she relies on Meta Business Suite.
- **Live research result:** neither **Blotato, GHL, nor the Meta/Instagram connectors** currently expose an AI-label toggle via API. Blotato supports it only on **TikTok and YouTube**, not Meta.
- **Riyaz's observation:** LinkedIn *auto-*flags AI images when posted natively, but not when pushed via the GHL social planner.
- **Prediction (Muhammad/Riyaz):** this becomes a GDPR-style worldwide requirement; expect tools to add support after Aug 2.
- **Action:** Nicole to write Meta directly and report back to the group.

### 4. Multi-model access via OpenRouter inside Claude Code
- Connecting **OpenRouter** unlocks Gemini, GPT, Grok, DeepSeek, GLM 5.2, Qwen, Mistral, Moonshot, Nvidia, Minimax, etc., all callable from within Claude Code (e.g. "use Gemini for research, GPT for X").
- Pay-as-you-go; he tops up ~$10 at a time (a $9 load lasted months).
- **Warning:** **DeepSeek v4 Pro burned tokens fastest** — check per-model cost before assuming "cheap."

### 5. Website security — a simple, repeatable tip
- Free tool **securityheaders.com**: paste any URL (AI-built, WordPress, anything), scan, then **screenshot the results and paste into Claude Code** — it fixes the flagged vulnerabilities automatically, no instruction needed.
- Credit to a TikTok creator, "the Lazy Developer." Especially important for client sites with forms/checkouts.
- **Infra habit:** Muhammad points all domains to **Cloudflare** (even when bought elsewhere) and uses the **Wrangler CLI** to push sites — connects cleanly to Claude Code / Codex.

### 6. Windows setup guidance (for Wale, first-time attendee)
- Claude Code needs **Node.js + NPM, Git**, and ideally **WSL** pre-installed — the common failure point for non-technical Windows users. Riyaz (dev background) had these already, which is why his install was painless.
- **4 GB RAM is not enough** (that's just Windows' minimum). Wale to install over the weekend and post issues in the WhatsApp group.

### 7. The AI-and-jobs discussion (~75–95 min)
The richest strategic segment of the call.

- **Frankie's reveal:** he *was* a 20-year IT developer/contractor (Intel, IBM). Muhammad's thesis: **AI + genuine domain expertise = superpower; AI alone ≠ a real professional.** (Accountant example: two non-accountants would accept a wrong AI answer that an accountant would catch instantly.)
- **Riyaz's concern (the pipeline gap):** senior devs can steer and critique AI because they earned their experience "in the weeds." Juniors now just manage agents and never build that judgment — so when seniors retire there's a **capability gap** with no obvious fix. Muhammad: applies to *all* AI-heavy industries.
- **Eduard's counter (historical analogy):** every disruption (print → digital) kills jobs and creates new ones. *"You won't lose your job to AI — you'll lose to a person who knows how to use AI."* Notes German companies that laid off staff for AI, saw it underdeliver, and **rehired**.
- **Wale's cautionary firsthand story:** as a London data-literacy coach, staff were asked to *document their processes* in 2023 "to free up time" → in 2024 the company automated those processes and **laid off coaches** (one coach's load went from 50 to 65–70 apprentices). Mass exodus, lost trust, even legal action to stop poaching. His point: **this lived experience is exactly why teams resist AI adoption** — even a well-intentioned "please document everything" reads as "you're building your own replacement."
- **Muhammad's framing:** a Dubai client's young, global team (all under 30, fitness industry) refuses AI training out of fear, even though the owner wants to *upskill* them, not fire them. His stance: AI may do 5–10 people's jobs, but it still needs **one skilled human** to run it; if the company scales, net new roles appear. The individual's duty is to become AI-capable and "indispensable." He also flagged the token-cost reality: some firms that fired humans **spent more on AI tokens** than they saved on labor.

---

## Action Items

| Owner | Action |
|---|---|
| Everyone | Stop over-prompting; set up Memory + Skills + Tools and just talk to it |
| Everyone (esp. GHL users) | Try Claude Code → **GHL MCP** for social publishing before paying for Blotato |
| Nicole | Contact Meta re: AI-label compliance for non-mobile publishing (EU law Aug 2); report back |
| Video creators | Test Claude Code video editing with raw footage (Descript → Whisper / FFmpeg / hyperframes); use Sonnet 5 to save tokens |
| Anyone shipping sites | Run **securityheaders.com** → screenshot → paste into Claude Code to auto-harden |
| OpenRouter users | Load small credit; avoid DeepSeek v4 Pro unless watching token burn |
| Wale | Install Node/NPM/Git (+ WSL) on Windows this weekend; use ≥ 8 GB RAM; ask in WhatsApp if stuck |
| Teams / leaders | Address AI-adoption fear directly — frame as upskilling, not replacement; expect resistance rooted in real layoff stories |

---

## Tools & Resources Referenced

- **securityheaders.com** — free website security-header scanner (credit: "the Lazy Developer" on TikTok)
- **Blotato** — social publishing tool; MCP-connectable to Claude Code; strong for YouTube + fine-grained controls
- **GoHighLevel (GHL) MCP** — full social-posting toolset; alternative to Blotato for existing GHL users
- **OpenRouter** — multi-model gateway inside Claude Code (Gemini, GPT, Grok, DeepSeek, GLM, Qwen, Mistral, etc.)
- **Descript** — recording tool that splits camera + screen into separate files for editing
- **Whisper / FFmpeg / hyperframes** — free tools Claude Code orchestrates for video editing
- **Cloudflare + Wrangler CLI** — domain hosting + deployment, integrates with Claude Code / Codex
- **Meta Ads MCP / Google Ads MCP** — for running paid campaigns via AI agents

---

*Prepared from the full Fireflies transcript. The Otter export covered only the first ~26 minutes; everything in Part 2 is additional.*
