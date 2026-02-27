# Breakroom Claude Code Plugin Marketplace

A collection of Claude Code plugins.

## Plugins

### Elixir

Plugin for working on Elixir projects.

- **LSP integration** — Configures `elixir-ls`
- **Writing Elixir skill** — Coding conventions for writing Elixir code
- **Testing skill** — Testing guidelines including TDD approach

### Flox

Plugin for managing [Flox](https://flox.dev) environments.

- **Environment management skill** — Guides activation, service management (Postgres, OpenSearch, Redis), and dependency handling
- **Session start hook** — Automatically checks whether the correct Flox environment is active when a Claude Code session starts, and warns if not

### Linear

Plugin for managing [Linear](https://linear.app) issues.

- **Fix issue skill** — Attempts a one-shot fix of a Linear bug, producing a draft PR assigned to you