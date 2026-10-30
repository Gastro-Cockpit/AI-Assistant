# ChatGPT Plugins Directory

What we enter at <https://platform.openai.com/plugins> ("Create plugin", "With MCP"). OpenAI keeps the base listing
in English and takes a German subtitle and description as the `de-DE` translation. Reviewer credentials go into the
dashboard's secure form only, never into this repository or the package.

## Listing

| Field                   | Value                                                                  |
| ----------------------- | ---------------------------------------------------------------------- |
| displayName (≤ 30)      | Gastro Cockpit                                                         |
| shortDescription (≤ 30) | Restaurant staff scheduling                                            |
| developerName           | set from the verified developer identity: Gastro Cockpit GmbH          |
| category                | Productivity (or the closest business category the dashboard offers)   |
| websiteURL              | <https://gastro-cockpit.de>                                            |
| supportURL              | <https://gastro-cockpit.de/hilfe/>                                     |
| privacyPolicyURL        | <https://gastro-cockpit.de/datenschutz-app/>                           |
| termsOfServiceURL       | <https://gastro-cockpit.de/nutzungsbedingungen/>                       |
| brandColor              | `#FFA000`, the primary button color of the sign-in page                |
| logo                    | `Logo-CI/Logo_primary/Logo_svg/logo_icon_only.svg`, as PNG if required |
| countries               | `DE`, `AT`, `CH`                                                       |
| commerce                | no: the plugin sells nothing and moves no money                        |

**capabilities:**

- Read the schedule, the team and worked hours
- Plan and publish the weekly schedule
- Cover sick days with replacements
- Decide vacation and time-off requests
- Check labor cost and minijob limits

**defaultPrompt (≤ 128 each):**

- What's going on at my restaurant today?
- Plan next week's open shifts.
- What is still open before payroll?

**longDescription (≤ 4,000):** the description of [anthropic.md](anthropic.md) with "Claude" replaced by
"ChatGPT", plus this paragraph:

> Limitations: Gastro Cockpit and this plugin are made for restaurants in Germany and follow German labor law.
> Employees cannot connect; only owners and the managers they allow. The plugin prepares payroll but does not
> run it, and it never moves money.

## de-DE translation

- subtitle (≤ 30): Dienstplan für die Gastronomie
- description: the German description of [anthropic.md](anthropic.md) with "Claude" replaced by "ChatGPT", plus:

> Grenzen: Gastro Cockpit und dieses Plugin sind für Restaurants in Deutschland gemacht und folgen dem deutschen
> Arbeitsrecht. Mitarbeiter können sich nicht verbinden, nur Inhaber und die Manager, denen sie es erlauben. Das
> Plugin bereitet die Lohnabrechnung vor, führt sie aber nicht durch, und es bewegt nie Geld.

## Review: test cases

The initial review needs exactly five positive and three negative cases, and a demo recording.

| #   | Description        | Prompt                                                | Tools                               | Expected behavior                                                                                      |
| --- | ------------------ | ----------------------------------------------------- | ----------------------------------- | ------------------------------------------------------------------------------------------------------ |
| 1   | Daily briefing     | What's going on at my restaurant today?               | `get_briefing`                      | Who works today, open shifts, absences (kind only), waiting requests and labor cost; nothing changes.  |
| 2   | Find a replacement | Who can cover tomorrow's evening shift?               | `get_day_overview`, `suggest_staff` | A short list of suitable staff with the reason for each; nothing is assigned without a yes.            |
| 3   | Plan a week        | Plan next week's open shifts.                         | `plan_week`                         | A proposal of who works which shift and what stays open, then one question before anything is written. |
| 4   | Waiting requests   | Which requests are waiting for me?                    | `get_inbox`                         | The open vacation, time-off and time-correction requests with who asked and for when.                  |
| 5   | Labor cost         | How does labor cost compare to the target this month? | `get_cost_forecast`                 | Totals for the month against the target; no wage of any single person.                                 |

| #   | Description                       | Prompt                                            |
| --- | --------------------------------- | ------------------------------------------------- |
| 1   | Personal pay and bank data        | Show me Anna's salary and her bank details.       |
| 2   | Moving money                      | Pay out this month's wages to the team.           |
| 3   | A location outside the connection | Show me the schedule of a restaurant I don't run. |

`demo_recording_url`: a screen recording of cases 1 to 3 in ChatGPT with the review account, link reachable for
the reviewers.
