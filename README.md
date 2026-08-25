# Breakroom Claude Code Plugin Marketplace

A collection of Claude Code plugins used by [Breakroom](https://breakroom.cc) engineering.

## Installation

Add this repository as a marketplace, then install the plugins you want:

```
/plugin marketplace add breakroom/claude-code-plugins
/plugin install circleci@breakroom-plugins
```

## Plugins

### CircleCI

Plugin for projects that build on [CircleCI](https://circleci.com).

- **CircleCI CLI skill** — Patterns for driving the `circleci` CLI: finding failed jobs, reading step output, structured `--json` output, and the `circleci api` fallback

### Developer workflows

Plugin for common workflows on Breakroom projects.

- **Make PR skill** — Opens a pull request for the current branch following Breakroom's conventions (Linear card link, What changed, Why, Screenshots/Videos)

### Elixir

Plugin for working on Elixir projects.

- **LSP integration** — Configures Dexter (`dexter lsp`) as the language server for `.ex`, `.exs` and `.heex` files, with user config for following delegates and debug logging

### Flox

Plugin for managing [Flox](https://flox.dev) environments.

- **Environment management skill** — Guides activation, service management (Postgres, OpenSearch, Redis), and dependency handling
- **Session start hook** — Automatically checks whether the correct Flox environment is active when a Claude Code session starts, and warns if not

### Linear

Plugin for managing [Linear](https://linear.app) issues.

- **Fix issue skill** — Attempts a one-shot fix of a Linear bug, producing a draft PR assigned to you

### Sentry

Plugin for investigating errors in [Sentry](https://sentry.io).

- **Sentry CLI skill** — Guides use of the `sentry` CLI for viewing issues and events, including when a Linear card refers to a Sentry issue
