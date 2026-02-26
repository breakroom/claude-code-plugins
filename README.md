# Breakroom Claude Code Plugin Marketplace

A collection of Claude Code plugins.

## Plugins

### Elixir

Tools for working on Elixir projects.

- **LSP integration** — Configures `elixir-ls`.
- **Writing Elixir skill** — Coding conventions for writing Elixir code.
- **Testing skill** — Testing guidelines including TDD approach.

### Flox

Tools for managing [Flox](https://flox.dev) environments.

- **Environment management skill** — Guides activation, service management (Postgres, OpenSearch, Redis), and dependency handling.
- **Session start hook** — Automatically checks whether the correct Flox environment is active when a Claude Code session starts, and warns if not.

### Linear

Tools for managing [Linear](https://linear.app) issues.

- **Fix issue skill** — Automates fetching issue details from Linear, implementing fixes with tests, committing with the issue reference, and creating a draft PR.