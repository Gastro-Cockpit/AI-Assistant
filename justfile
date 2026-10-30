# Pinned, not the global oxfmt: another version rewrites files that CI then rejects.
oxfmt := "pnpm dlx oxfmt@0.74.0"

# Claude Code on the PATH; CI passes a pinned one.
claude := "claude"

_default:
	@just --list

# Format Markdown, JSON and YAML
format:
	{{oxfmt}} .

# Check the format and validate the plugin
lint:
	{{oxfmt}} --check .
	{{claude}} plugin validate .
