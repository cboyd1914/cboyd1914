# GHL MCP Comparison — HighLevel MCP for Anthropic vs. GHL Command

_Decision brief for choosing a GoHighLevel MCP connector. Last updated: 2026-07-08._

## TL;DR

- **GHL Command** (`@elitedcs/ghl-mcp`, self-hosted) is today's **primary and only** GHL MCP in the stack. Its edge is **confirmed workflow-builder access** (the revenue path) and direct low-latency flat tools.
- **HighLevel MCP for Anthropic** (official OAuth endpoint) is **architecturally more modern**, **more secure**, and **zero-maintenance** — but **workflow-builder coverage is unverified**.
- **Decision hinges on one thing:** whether the official 40-domain catalog includes workflow-builder operations. Verify with `search_operations` on a test Apex grant (checklist at the bottom).

## Three-way comparison

| Dimension | HighLevel MCP for Anthropic | Older GHL universal MCP | GHL Command (your setup) |
|---|---|---|---|
| **What it is** | Official OAuth cloud endpoint | Official shared cloud endpoint | Self-hosted `@elitedcs/ghl-mcp` via wrapper scripts |
| **Endpoint / run** | `…/mcp/anthropic/v2` (per-client path) | `…/mcp/` (universal) | Local wrapper `ghl-command-apex.sh`, pinned `@elitedcs/ghl-mcp@3.45.0` |
| **Tool architecture** | **Unified/compact** — a few meta-tools (`search_operations` + dispatcher) front the catalog | ~21 flat tools | **171 flat tools** (all consume context every call) |
| **Op count** | **625 ops / 40 domains** (243 read · 244 write · 84 delete) | Limited/focused core set | ~171 tools (public API read+write; workflow-builder) |
| **Auth model** | OAuth app (one-click, revocable) or PIT | Shared token/scope | Local `.env` secrets (PIT) + Firebase auth for workflow-builder |
| **Multi-location** | Per-client OAuth path | Single shared surface | Separate wrapper per client (apex/marathon/pamela/brandon) |
| **Workflow-builder** | ❓ Unverified — needs `search_operations` check | No | ✅ Yes — needs per-company Firebase creds + `switch_location` |
| **Safety gating** | Confirmation on irreversible ops + audit log + 5-min undo | Minimal | Preflight/rollback gates you built manually |
| **Clients** | Claude.ai, Claude Code, Cowork | Generic AI models | Codex, Claude Code, Claude Desktop |
| **Setup effort** | Low — OAuth connect | Low | High — wrappers, `.env`, Firebase, per-client smoke tests |
| **You control it?** | No (HighLevel hosts) | No | ✅ Yes — version-pinned, self-hosted |
| **Status in your stack** | New option (not yet adopted) | Replaced | ✅ Primary & only GHL MCP today |
| **Key limitation** | Widest-scope OAuth is a footgun; delete surface; wf-builder unverified | Too few tools | Manual Firebase gate per client; flat tools eat context |

## Deep analysis of the HighLevel MCP for Anthropic

### 1. Architecture — the real innovation (not the "625" number)
"625 operations" is **not** 625 tools. The endpoint uses a **unified tool design**: it exposes only a handful of meta-tools — notably **`search_operations`** (discover what your grant allows) plus a dispatcher to run them — and the full catalog sits *behind* them. This is HighLevel adopting Anthropic's own [code-execution / tool-search MCP pattern](https://www.anthropic.com/engineering/code-execution-with-mcp).

- **Why it matters:** 625 individual tool schemas would blow the context window and degrade tool-selection accuracy. Hiding them behind `search_operations` keeps the model's tool list tiny while capability stays huge.
- **vs. GHL Command:** GHL Command loads **171 flat tools** that consume context on every call. The unified design is strictly better at scale.
- **Trade-off — discovery friction:** the model must `search_operations` → then execute (an extra round-trip). Slightly slower per novel task; far better at scale.

### 2. Auth & security model (genuinely strong)
- **OAuth (recommended):** one-click consent, scopes approved on-screen, **review/revoke anytime**, nothing to store or rotate. Grants the *widest* scope set by default.
- **PIT alternative:** `Authorization: Bearer pit-...` + `locationId` header. Tighter pre-scoping; you manage the token.
- **Grant-based filtering:** operations the model can even *see* are filtered by your scopes; `search_operations` only surfaces what you granted.
- **Confirmation gating:** irreversible operations trigger a human **Yes/No** step.
- **Audit + undo:** every AI action logged under **Settings ▸ Audit Logs ▸ AI Chat**; **undo last action within 5 min** or restore from backup.
- **Per-client isolation:** the `/mcp/anthropic/v2` path isolates Claude's scopes from other clients (`/mcp/{client}/v2`).

### 3. The numbers
- **625 operations / 40 domains** — 243 read · 244 write · **84 delete**.
- The 84 delete + 244 write is the risk surface, but it's the *most-gated* surface (confirmation + 5-min undo + audit log).

### 4. Critical take
1. **Security beats GHL Command decisively** — OAuth scopes + grant filtering + confirmation + audit + 5-min undo vs. local `.env`/PIT/Firebase juggling. Revocable in one click, nothing to rotate.
2. **One-click OAuth "widest scope set" is a footgun** — convenience defaults to maximum permission. For client work, scope down deliberately, or use a **narrowly-scoped PIT** instead.
3. **Workflow-builder is the open question** — the one confirmed edge GHL Command has. HighLevel says the catalog is "well beyond the original toolset" across 40 domains, but wf-builder inclusion is unverified without a live `search_operations` run.
4. **Discovery-based = better for open-ended agent work, worse for tight scripted loops.** Known 3-op jobs are more direct on GHL Command's flat tools.

> Note: the live endpoint could not be probed from the analysis environment (network policy blocked `services.leadconnectorhq.com`). Details are from HighLevel's official docs and support portal.

## Recommendation

Keep **GHL Command as production** (it has confirmed workflow-builder, your revenue path). **Pilot the Anthropic endpoint on a single non-client location (Apex)** and run the checklist below. If the 40-domain catalog includes workflow-builder and OAuth isolation holds, migrate to retire the wrapper/Firebase maintenance burden. If not, keep GHL Command.

## `search_operations` verification checklist (run on connect)

Connect the Anthropic endpoint to a **test Apex grant**, then have Claude run `search_operations` for each and record hit/miss:

- [ ] `search_operations("workflow")` — do workflow-builder ops exist? (get/validate/update workflow)
- [ ] `search_operations("workflow builder")` / `search_operations("automation")`
- [ ] `search_operations("contact")` — confirm read + write + delete parity with GHL Command
- [ ] `search_operations("opportunity")` / `search_operations("pipeline")`
- [ ] `search_operations("calendar")` and `search_operations("appointment")`
- [ ] `search_operations("conversation")` / `search_operations("message")` — SMS/email history reads
- [ ] `search_operations("payment")` / `search_operations("invoice")`
- [ ] `search_operations("custom field")` and `search_operations("tag")`
- [ ] `search_operations("location")` — multi-location / switch-location equivalents
- [ ] Count total ops visible under the grant; compare to the 625 headline (confirms scope-down worked)
- [ ] Confirm each **delete** op you care about triggers the Yes/No confirmation step
- [ ] Verify actions land in **Settings ▸ Audit Logs ▸ AI Chat** and the 5-min undo works

**Go/no-go:** if the `workflow` searches return builder ops with read+validate+update, the Anthropic endpoint can replace GHL Command. Otherwise, keep GHL Command for workflow-builder and optionally use the Anthropic endpoint for everything else.

## Sources
- [LeadConnector MCP Server — HighLevel API docs](https://marketplace.gohighlevel.com/docs/other/mcp/)
- [How to Use the HighLevel MCP Server — Support Portal](https://help.gohighlevel.com/support/solutions/articles/155000005741-how-to-use-the-highlevel-mcp-server)
- [HighLevel MCP Server Setup & Configuration Guide](https://help.gohighlevel.com/support/solutions/articles/155000007981-highlevel-mcp-server-model-context-protocol-)
- [Anthropic — Code execution with MCP](https://www.anthropic.com/engineering/code-execution-with-mcp)
- [Claude + GoHighLevel MCP Integration Guide (2026)](https://autogencrm.com/claude-ghl-integration-mcp-setup-2026/)
- Internal: Notion — "GHL Command migration: removed all busybee-* servers" (2026-07-08); "Reconnect Apex Resolution GHL MCP" (Apex test, `@elitedcs/ghl-mcp@3.45.0`, 171-tool probe)
