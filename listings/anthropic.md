# Claude Connectors Directory

What we enter in the developer portal (<https://claude.ai/directory/manage>, "Submit new", "MCP connector"). The
portal has one text per field and no translations, so the listing is in English; the German text below is for the
website and for reference.

## Connection

- Server URL: `https://mcp.gastro-cockpit.de/mcp`
- One URL for every customer (no per-customer URLs).

## Listing

| Field              | Value                                                                                |
| ------------------ | ------------------------------------------------------------------------------------ |
| Name (≤ 100)       | Gastro Cockpit                                                                       |
| Slug (permanent)   | `gastro-cockpit`                                                                     |
| Categories (1–5)   | the closest of the portal's list: productivity, operations                           |
| Documentation URL  | <https://gastro-cockpit.de/hilfe/standort-und-einstellungen/ki-assistent-verbinden/> |
| Privacy policy URL | <https://gastro-cockpit.de/datenschutz-app/> (section 13)                            |
| Support contact    | support@gastro-cockpit.de                                                            |
| Icon               | `Logo-CI/Logo_primary/Logo_svg/logo_icon_only.svg`                                   |

**One-liner (≤ 200):**

> Plan shifts, cover sick days and check the month before payroll for your restaurant, straight from the chat, with
> the data of your Gastro Cockpit account.

**Description (≤ 2,000):**

> Gastro Cockpit is the shift planning and time tracking app for restaurants and cafés in Germany. This connector
> lets Claude work with the locations you run: it reads the schedule, the team, worked hours, open requests and
> labor cost, and on your yes in the chat it changes them.
>
> Ask in your own words, for example "What's going on today?", "Plan next week", "Anna called in sick, who can
> cover?" or "What is still open before payroll?". Claude plans the open shifts of a week with the same planner as
> the app, proposes replacements, decides vacation and time-off requests, corrects tracked time and publishes the
> schedule. Every change is shown to you first and made only after you confirm it; your staff see it in the app
> as if you had made it there.
>
> Who can connect: every owner of a location, and a manager when the owner allows it in the app. You need a
> Gastro Cockpit account; you sign in with a code sent to your email or with your password and choose the
> locations Claude may reach.
>
> Privacy by design: Claude never receives wages per person, tax, bank or social security data, addresses, phone
> numbers, birth dates or the content of sick notes. Sick days reach Claude per person only when an owner releases
> health data for the connection. Every call is logged, and owners can end any connection in the app.

## Use cases

The portal takes up to three and shows them to the reviewers only, not in the listing. The prompts are the first
three review cases of the ChatGPT listing (`plugin.json`), so both reviews test the same data.

| #   | Use case                             | Example prompt                            |
| --- | ------------------------------------ | ----------------------------------------- |
| 1   | Daily briefing of a location         | What's going on at my restaurant today?   |
| 2   | Plan and publish the weekly schedule | Plan next week's open shifts.             |
| 3   | Find staff for an extra shift        | Who can work tomorrow from 5 pm to 11 pm? |

**Prerequisites:**

> A Gastro Cockpit account that owns a location, or a manager account whose owner turned on "KI-Assistent nutzen"
> in the app. Sign in with a code sent by email or with the account password, then choose the locations Claude may
> reach.

**Read/write:** reads and writes. The read tools carry `readOnlyHint`, the write tools `destructiveHint`.

## Company

- Gastro Cockpit GmbH, <https://gastro-cockpit.de>
- Primary contact for the review: Marvin Heilemann, marvin@gastro-cockpit.de

## Authentication

- Required. OAuth 2.1 with PKCE (S256) and dynamic client registration; public clients, no client secret.
- Anthropic does not need to hold a client.

## Data handling

- The API is our own (first-party).
- Personal health data: **yes**. An owner can release sick-leave data per connection on the consent page,
  confirming a data processing agreement with the provider; without it Claude sees sick days only as location
  totals.
- No sponsored content.

## Test & launch

The credentials go into the portal only, never into this repository.

1. Add `https://mcp.gastro-cockpit.de/mcp` as a custom connector.
2. On the Gastro Cockpit sign-in page choose "Mit Passwort anmelden" and sign in with the review account.
3. Tick the location "Gastro Cockpit Verification" and allow. It holds realistic demo data and no real staff; the
   review account is a manager there whom the owner allowed to use the assistant.
4. Try: "What's going on at my restaurant today?", "Who can work tomorrow from 5 pm to 11 pm?", "Plan next week's
   open shifts." (Claude shows a proposal and asks before it writes), "Which requests are waiting for me?", "How
   does labor cost compare to the target this week?".

We confirm in the portal that every tool was run through Claude as a custom connector.

## Plugin bundle

A second submission from the same organization ("Plugin bundle"): this repository, branch `main`, the plugin at its
root. The directory reads name, description and the listing links from `.claude-plugin/plugin.json` and lists the
plugin on Claude Code, Cowork and the Claude apps.

**Data handling:**

| Question                                       | Answer           | Why                                                                                                     |
| ---------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------- |
| Reads or stores personal data                  | Reads and stores | The connector reads staff names, shifts, hours, absences and requests and writes what the user confirms |
| A skill sends data to another service          | No               | The skills call only the connector's tools                                                              |
| How long data received from Claude is retained | Longer           | See below                                                                                               |
| Intended for users under 18                    | No               | Only owners and the managers they allow can connect                                                     |

> Each tool call writes one audit row (ids, an HMAC of the arguments, the outcome; never the content), kept for 12
> months. Changes the user confirms in the chat, such as assigned shifts or decided requests, are stored in Gastro
> Cockpit like any change made in the app and follow its retention, including the statutory retention of
> working-time records. Details: https://gastro-cockpit.de/datenschutz-app/ (sections 13 and V).

The scan of 2026-11-07 refused the version because of the `justfile` (`LOCAL_CODE_FILE_TYPE`): from an
organization that Anthropic has not verified, the directory takes only Markdown, text, JSON, YAML and images. Its
commands moved into `lint.yml` and `.claude/CLAUDE.md`. The remaining findings hold the plugin for a manual
review and all come from `.github/workflows/publish-mcp.yml`: it downloads `mcp-publisher` and reads the registry
secret, in GitHub Actions only, never on a user's machine. If a reviewer objects, the plugin moves into a
subfolder, which needs a new submission. The root `plugin.json` (Agent Plugins format, for ChatGPT) is noted and
ignored by Claude.

Submitted on 2026-11-05 with auto-publish off and new versions by scheduled check only (about every 6 hours): `main`
also carries listing texts and the OpenAI manifest, so every version is published by hand. Tracking a release tag
instead would make auto-publish safe.

---

## Deutsch

**Einzeiler:**

> Schichten planen, Krankheitstage abdecken und den Monat vor der Lohnabrechnung prüfen, direkt im Chat und mit den
> Daten deines Gastro-Cockpit-Kontos.

**Beschreibung:**

> Gastro Cockpit ist die App für Dienstplan und Zeiterfassung in Restaurants und Cafés in Deutschland. Mit diesem
> Connector arbeitet Claude mit den Standorten, die du führst: Er liest den Dienstplan, das Team, die gearbeiteten
> Stunden, offene Anfragen und die Personalkosten, und nach deinem Ja im Chat ändert er sie.
>
> Frag in deinen eigenen Worten, zum Beispiel „Was ist heute los?“, „Plan mir die nächste Woche“, „Anna hat sich
> krank gemeldet, wer kann einspringen?“ oder „Was fehlt noch für die Lohnabrechnung?“. Claude plant die offenen
> Schichten einer Woche mit derselben Planung wie die App, schlägt Ersatz vor, entscheidet Urlaubs- und
> Freistellungsanträge, korrigiert erfasste Zeiten und veröffentlicht den Dienstplan. Jede Änderung zeigt er dir
> vorher und trägt sie erst nach deinem Ja ein; dein Team sieht sie in der App, als hättest du sie dort gemacht.
>
> Verbinden kann jeder Inhaber eines Standorts und ein Manager, wenn der Inhaber es ihm in der App erlaubt. Du
> brauchst ein Gastro-Cockpit-Konto; du meldest dich mit einem Code per E-Mail oder mit deinem Passwort an und
> wählst die Standorte aus, die Claude sehen darf.
>
> Datenschutz von Anfang an: Claude bekommt nie Löhne einzelner Personen, Steuer-, Bank- oder
> Sozialversicherungsdaten, Anschriften, Telefonnummern, Geburtsdaten oder Inhalte von Krankmeldungen.
> Krankheitstage pro Person sieht er nur, wenn ein Inhaber Gesundheitsdaten für die Verbindung freigibt. Jeder
> Abruf wird protokolliert, und Inhaber können jede Verbindung in der App beenden.
