# ChatGPT Plugins Directory

The listing, the review cases, the countries and the German translation live in `extensions.com.openai` of the root
[`plugin.json`](../plugin.json); the portal imports them from the ZIP and shows them read-only. The texts follow
[anthropic.md](anthropic.md) with "Claude" replaced by "ChatGPT", plus a paragraph on the limitations. This file
holds only what the ZIP cannot carry.

## Submit

1. `just zip` builds `dist/gastro-cockpit-<version>.zip` from the last commit.
2. At <https://platform.openai.com/plugins> choose "Upload new or existing plugin", the verified developer identity
   Gastro Cockpit GmbH, and the ZIP. The project must have global data residency: projects with EU data residency
   cannot submit plugins with an MCP server.
3. Under **MCPs**, connect `gastro-cockpit`. The portal shows a domain-verification token: serve it as plain text at
   `https://mcp.gastro-cockpit.de/.well-known/openai-apps-challenge` (Caddy, Documentation repository), then
   connect and sign in. Authentication is OAuth with dynamic client registration, found through discovery.
4. Check the scanned tools and their annotations under **Issues**, then **Rescan** after every server fix.
5. Under **Review details**, enter the review account (below) and the URL of the demo recording, then submit.

## Review account

Credentials go into the portal's secure form only, never into this repository or the ZIP. The account must sign in
without an email code, so the instructions use the password.

1. On the Gastro Cockpit sign-in page choose "Mit Passwort anmelden" and sign in with the review account.
2. Tick the location "Gastro Cockpit Verification" and allow; leave „Gesundheitsdaten freigeben“ off, so the
   expected results of the review cases hold. The location holds demo data and no real staff.

The review cases speak of today, tomorrow, next week and this month, so the location needs shifts, open seats,
waiting requests and tracked time around the review date, and again for every later review.

## Demo recording

A screen recording in ChatGPT with the review account that runs the five positive and three negative cases of
`plugin.json`. The link must be reachable for the reviewers; it goes into `review.demo_recording_url` of
`plugin.json` or into the portal.
