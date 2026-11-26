# Gastro Cockpit AI Assistant

The plugin that connects an AI assistant, such as Claude or ChatGPT, to [Gastro Cockpit](https://gastro-cockpit.de),
the staff scheduling, time tracking and payroll preparation app for restaurants. What the plugin does, how to use it
and what data it sends: [plugin/README.md](plugin/README.md).

The MCP server itself is not part of this repository. It runs at `https://mcp.gastro-cockpit.de/mcp`.

## Repository

| Path          | What                                                                     |
| ------------- | ------------------------------------------------------------------------ |
| `plugin/`     | The plugin: the skills, the manifests for Claude and ChatGPT, its README |
| `listings/`   | What we enter in the Claude and ChatGPT directories                      |
| `server.json` | The entry `de.gastro-cockpit/mcp` in the official MCP Registry           |

## License

The files in this repository are licensed under the [EUPL-1.2](LICENSE). All language versions of the EUPL are equally
valid. The name "Gastro Cockpit" and its logo are not covered by this license: Gastro Cockpit GmbH keeps all rights to
them.
