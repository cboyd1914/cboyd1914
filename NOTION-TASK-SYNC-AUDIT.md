# Notion ↔ Linear/GitHub Task Sync Audit — 2026-07-13

Audit of all open tasks in the Notion **Task Tracker** (Apex Resolution Hub) and the
**[CC] Tasks Database** to ensure every technical/engineering task has Linear and
GitHub tracking.

Notion audit page: https://app.notion.com/p/39c15d5b00a081e0b356e29539b3ca20

## Summary

- ~90 open tasks reviewed across both databases.
- **19 technical tasks had no Linear issue and no GitHub tracking.** A GitHub issue
  was created for each in `cboyd1914/apex-workspace` (#30–#48), labeled
  `notion-sync` + `needs-linear`, and each Notion task was annotated with its
  issue link.
- **Linear issues could not be created in this session** — the Linear connector is
  unauthenticated. Every new issue and Notion task carries a
  "Linear: APE issue still needed" marker so the batch can be created in one pass
  once Linear is connected.

## New GitHub issues (each still needs a Linear APE issue)

| # | Title | Notion source | Notes |
|---|-------|---------------|-------|
| [#30](https://github.com/cboyd1914/apex-workspace/issues/30) | Finish GHL automatic spam-call quarantine workflow | Task Tracker | High, In Progress |
| [#31](https://github.com/cboyd1914/apex-workspace/issues/31) | Stop Google Business scam robocall voicemails | Task Tracker | High |
| [#32](https://github.com/cboyd1914/apex-workspace/issues/32) | Set up Descript MCP connection with Claude | Task Tracker | Low |
| [#33](https://github.com/cboyd1914/apex-workspace/issues/33) | Build reusable Descript editing skill | Task Tracker | Low, depends on #32 |
| [#34](https://github.com/cboyd1914/apex-workspace/issues/34) | Configure Apify credentials (Richmond enrichment) | Task Tracker | Looks nearly complete — verify & close |
| [#35](https://github.com/cboyd1914/apex-workspace/issues/35) | Evaluate Apify MCP + Prospecting Pilot | Task Tracker | High, In Progress |
| [#36](https://github.com/cboyd1914/apex-workspace/issues/36) | GBP: Configure direct GBP API credentials | Task Tracker | Blocked on Google allowlisting |
| [#37](https://github.com/cboyd1914/apex-workspace/issues/37) | GBP: Run first monthly scorecard | Task Tracker | Gated on #36 |
| [#38](https://github.com/cboyd1914/apex-workspace/issues/38) | Aria: GHL UI setup + end-to-end test call | Task Tracker | High |
| [#39](https://github.com/cboyd1914/apex-workspace/issues/39) | Deploy/test Brandon schedule-first booking flow | Task Tracker | High, In Progress |
| [#40](https://github.com/cboyd1914/apex-workspace/issues/40) | Google Workspace sender path for builtinkc.co | Task Tracker | High, In Progress |
| [#41](https://github.com/cboyd1914/apex-workspace/issues/41) | Run remaining BuildKC Manus batches (wk 4,6,7,8) | Task Tracker | High |
| [#42](https://github.com/cboyd1914/apex-workspace/issues/42) | Recover builtinkc.com before 2026-12-10 | Task Tracker | High |
| [#43](https://github.com/cboyd1914/apex-workspace/issues/43) | Activate NotebookLM MCP in remote sessions | Task Tracker | Blocked by design (browser-cookie auth) |
| [#44](https://github.com/cboyd1914/apex-workspace/issues/44) | Verify Higgsfield MCP unlimited-image-tier behavior | [CC] Tasks | |
| [#45](https://github.com/cboyd1914/apex-workspace/issues/45) | Scheduling layer: Content 360 vs GHL vs Blotato | [CC] Tasks | |
| [#46](https://github.com/cboyd1914/apex-workspace/issues/46) | Continue AI-powered intake form for GHL funnels | [CC] Tasks | |
| [#47](https://github.com/cboyd1914/apex-workspace/issues/47) | Fast Creator Mode / Codex satellite on Mac mini | [CC] Tasks | |
| [#48](https://github.com/cboyd1914/apex-workspace/issues/48) | SECURITY: Rotate Meta CAPI token (dataset 815332645789083) | [CC] Tasks | **Launch gate for Sprint D8; overdue since 2026-06-14** |

## Already tracked in Linear (verified, no action needed)

APE-306 (visibility scanner), APE-275/276/277/278 (SOP operationalization),
APE-274 (exposed-secrets batch; APE-196 Blotato, APE-212 Airtable),
APE-261 (Consistency Crew), APE-133 (Chantel GHL domain SOP),
APE-131 (GHL domain verification script), APE-189 (OpenRouter reapplication),
APE-286 (Hyperagent credit tracking).

## Intentionally Notion-only

Personal errands, bookings, VA-claim paperwork, sales outreach, coaching
takeaways (25K Challenge batch), and GPLOA/USA Lacrosse coordination tasks do
not need engineering trackers and were left untouched.

## Follow-up once the Linear connector is authorized

For each issue #30–#48: create an APE issue in the `apex-resolution` workspace,
cross-link it in the GitHub issue and the Notion task, then remove the
`needs-linear` label.
