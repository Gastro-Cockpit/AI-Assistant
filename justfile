# Pinned, not the global oxfmt: another version rewrites files that CI then rejects.
oxfmt := "pnpm dlx oxfmt@0.74.0"

# Claude Code on the PATH; CI passes a pinned one.
claude := "claude"

version := `jq -r .version plugin.json`

_default:
	@just --list

# Format Markdown, JSON and YAML
format:
	{{oxfmt}} .

# Check the format, validate the plugin and check that every manifest carries one version
lint:
	{{oxfmt}} --check .
	{{claude}} plugin validate .
	test "$(jq -r .version .claude-plugin/plugin.json)" = "{{version}}"
	test "$(jq -r .version server.json)" = "{{version}}"

# Build the ChatGPT upload from the last commit; uncommitted changes stay out
zip:
	mkdir -p dist
	git archive --format=zip -o dist/gastro-cockpit-{{version}}.zip HEAD plugin.json mcp.json .claude-plugin skills README.md LICENSE
	@echo dist/gastro-cockpit-{{version}}.zip
