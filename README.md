# Gastro Cockpit AI Assistant

[Gastro Cockpit](https://gastro-cockpit.de) is staff scheduling, time tracking and payroll preparation for restaurants.
This plugin connects an AI assistant, such as Claude or ChatGPT, to Gastro Cockpit: the assistant reads the
schedule, the team, hours, requests and labor cost of your locations and, after your yes in the chat, plans shifts,
publishes the week and decides requests. The MCP server itself is not part of this repository.

## Use it

The quickest way: paste this line into your AI assistant. An assistant that can change its own setup adds the server
itself; any other shows you where to add it in its settings.

```text
Richte mir den MCP-Server von Gastro Cockpit ein: Er heißt gastro-cockpit, läuft unter https://mcp.gastro-cockpit.de/mcp über Streamable HTTP und meldet mich per OAuth an. Kannst du ihn nicht selbst eintragen, führe mich Schritt für Schritt durch deine Einstellungen.
```

Or install the plugin and connect its Gastro Cockpit connector (`https://mcp.gastro-cockpit.de/mcp`). You sign in with
your Gastro Cockpit account, with a code sent to your email or with your password, and choose the locations the
assistant may reach. Every owner of a location can connect; a manager can connect when the owner allows it in the
app.

Then ask in your own words. Four skills cover the everyday jobs:

- **tagesbriefing**: "Was ist heute los?" Who works, open shifts, absences, waiting requests, labor cost.
- **woche-planen**: "Plan mir die nächste Woche." Fills the week and asks once before it enters anything.
- **krankmeldung-bearbeiten**: "Anna hat sich krank gemeldet." Shows the affected shifts and proposes a replacement.
- **monatsabschluss**: "Was fehlt noch für die Lohnabrechnung?" Lists what is open before the payroll.

## Data

The plugin stores nothing itself. Your questions go to your AI provider, and the assistant exchanges the data it
needs with your Gastro Cockpit account through `mcp.gastro-cockpit.de`. It sees no wages per person, no contact,
tax, bank or social security data and no content of sick notes. Details are in the
[privacy policy](https://gastro-cockpit.de/datenschutz-app/), section 13.

## Maintenance

The skills restate the prompts the server offers (`PROMPTS` in the app's
`backend/apps/assistant/mcp/instructions.py`); change both together.

## License

The files in this repository are licensed under the [EUPL-1.2](LICENSE). All language versions of the EUPL are equally
valid. The name "Gastro Cockpit" and its logo are not covered by this license: Gastro Cockpit GmbH keeps all rights to
them.
