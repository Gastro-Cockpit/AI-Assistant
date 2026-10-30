# AI-Assistant — Claude Code instructions

This public repository holds the plugin and the directory listings of the Gastro Cockpit AI assistant. The MCP
server itself lives in the private app repository (`backend/apps/assistant/`, overview in `docs/MCP_SERVER.md`
there) and runs at `https://mcp.gastro-cockpit.de/mcp`. Nothing here is server code.

## Layout

| Path                         | What                                                                                         |
| ---------------------------- | -------------------------------------------------------------------------------------------- |
| `.claude-plugin/plugin.json` | Plugin manifest; Claude reads it, and OpenAI converts it on upload                           |
| `.claude-plugin/icon.png`    | The app icon, 1024 px square; the directory takes it only the first time the plugin is saved |
| `.mcp.json`                  | The one remote MCP server the plugin connects                                                |
| `skills/<name>/SKILL.md`     | One folder per skill; the folder name equals the skill's `name`                              |
| `listings/`                  | What we enter in the Claude and ChatGPT portals, English with a German version               |
| `README.md`, `LICENSE`       | Both directories require them; the README is the listing text of the Claude plugin           |

## Rules

- **Public repository.** No credentials, tokens, reviewer passwords or customer data, ever. Reviewer access goes
  into the portals' secure forms only.
- **`name` in `plugin.json` is permanent** (`gastro-cockpit`): people install the plugin by it. Raise `version` on
  every release.
- **Skills only.** No commands, agents, hooks or `bin/`: OpenAI drops commands and agents, refuses hooks, and a
  top-level `bin/` stops claude.ai from installing the plugin.
- **Provider-neutral skills.** Never name Claude or ChatGPT in a skill; write "the person" for the user. The text
  instructs the model in English and keeps the German example phrases in the `description`, because those are
  what the model matches against.
- **Skills restate the server's prompts** (`PROMPTS` in the app's `backend/apps/assistant/mcp/instructions.py`,
  which points back here). Change both together. A skill names only tools the server registers and carries no
  business rule of its own (hours, limits, eligibility): the backend decides those, the skill only orders the
  steps.
- **Listing limits:** Claude one-liner ≤ 200 and description ≤ 2,000 characters; ChatGPT `displayName` and
  `shortDescription` ≤ 30, `longDescription` ≤ 4,000, starter prompts ≤ 128, exactly five positive and three
  negative review cases. Count before you change a text.
- **The README** needs at least 40 words outside code blocks and says what the plugin does, how to use it and
  what data it sends.
- **Facts come from the app repository,** not from memory: who may connect (`connectable_location_q`), what the
  assistant never sees (the data policy in `backend/apps/assistant/tools/registry.py`), and the privacy policy at
  <https://gastro-cockpit.de/datenschutz-app/> (section 13).

## Checks

- `claude plugin validate .` must print `✔ Validation passed`.
- `oxfmt --check .` for Markdown and JSON.
- The OpenAI upload is a ZIP of `.claude-plugin/`, `.mcp.json`, `skills/`, `README.md` and `LICENSE` only; leave
  `listings/` and `.claude/` out. This file sits in `.claude/` because a `CLAUDE.md` at the plugin root makes the
  validator warn.

## Commits

Conventional Commits with a sentence-case subject (`docs: Add …`, `feat: …`), no co-author lines. Never push
without being asked.
