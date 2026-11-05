# AI-Assistant — Claude Code instructions

This public repository holds the plugin and the directory listings of the Gastro Cockpit AI assistant. The MCP
server itself lives in the private app repository (`backend/apps/assistant/`, overview in `docs/MCP_SERVER.md`
there) and runs at `https://mcp.gastro-cockpit.de/mcp`. Nothing here is server code.

## Layout

| Path                                | What                                                                                                                                                          |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `.claude-plugin/plugin.json`        | Plugin manifest for Claude                                                                                                                                    |
| `.claude-plugin/icon.png`           | The app icon, 1024 px square; the directory takes it only the first time the plugin is saved; `server.json` links it by its raw GitHub URL on `main`          |
| `.mcp.json`                         | The one remote MCP server the plugin connects, for Claude                                                                                                     |
| `plugin.json`, `mcp.json`           | The same plugin and server for ChatGPT (Agent Plugins format), with the listing, review cases, countries and German translation under `extensions.com.openai` |
| `skills/<name>/SKILL.md`            | One folder per skill; the folder name equals the skill's `name`                                                                                               |
| `listings/`                         | What we enter in the Claude and ChatGPT portals, English with a German version                                                                                |
| `server.json`                       | The entry `de.gastro-cockpit/mcp` in the official MCP Registry                                                                                                |
| `.github/workflows/publish-mcp.yml` | Publishes `server.json` to the registry when a `v*` tag is pushed                                                                                             |
| `justfile`, `.oxfmtrc.json`         | `just format` and `just lint`; the oxfmt config keeps a format config outside the repository from applying                                                    |
| `.github/workflows/lint.yml`        | Runs `just lint` on every push to `main` and every pull request                                                                                               |
| `README.md`, `LICENSE`              | Both directories require them; the README is the listing text of the Claude plugin                                                                            |

## Rules

- **Public repository.** No credentials, tokens, reviewer passwords or customer data, ever. Reviewer access goes
  into the portals' secure forms only.
- **`name` in both plugin manifests is permanent** (`gastro-cockpit`): people install the plugin by it. Raise
  `version` on every release.
- **Two manifests, one plugin.** The root `plugin.json` repeats the root fields of `.claude-plugin/plugin.json`
  (`name`, `version`, `description`, `author`, …), and `mcp.json` repeats the server of `.mcp.json`: change both.
  OpenAI reads only the root pair, Claude only the other.
- **One version, one tag.** `server.json` and both plugin manifests carry the same `version`; `just lint` checks it.
  Pushing the tag `v<version>` publishes it to the MCP Registry; the workflow refuses a tag that differs from any of
  the three, and the registry never takes a version twice.
- **Registry key.** The registry trusts the Ed25519 key in the `v=MCPv1` TXT record on the apex of
  `gastro-cockpit.de` (`configs/gastro-cockpit-de.zone` in the Documentation repository). Its private half is
  `MCP_PRIVATE_KEY` in the `mcp-registry` environment, which admits `v*` tags only; it can publish every server
  under `de.gastro-cockpit`. To rotate it, replace the TXT record (the registry tries a stale record first and
  fails) and the secret. Take the 64 hex characters with
  `openssl pkey -in key.pem -outform DER | tail -c 32 | xxd -p -c 64`: the `grep -A3 priv:` line of the registry
  docs also catches `pub` when OpenSSL prints 16 bytes per line.
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

- `just lint` must pass: `oxfmt --check .` for Markdown, JSON and YAML, then `claude plugin validate .`, which must
  print `✔ Validation passed`. `just format` fixes the format. Both pin oxfmt; CI also pins Claude Code.
- The OpenAI upload is `just zip`: a ZIP of `plugin.json`, `mcp.json`, `.claude-plugin/` (for the icon), `skills/`,
  `README.md` and `LICENSE` from the last commit, in `dist/`. `listings/` and `.claude/` stay out. This file sits in
  `.claude/` because a `CLAUDE.md` at the plugin root makes the validator warn.

## Commits

Conventional Commits with a sentence-case subject (`docs: Add …`, `feat: …`), no co-author lines. Never push
without being asked.
