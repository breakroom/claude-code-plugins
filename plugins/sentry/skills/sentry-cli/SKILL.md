---
name: sentry-cli
description: Guide for using the Sentry CLI to interact with Sentry from the command line. Use when the user asks about viewing Sentry issues or events, or when a Linear card refers to a Sentry issue to get more detail on the problem.
---

# Sentry CLI

Helps users interact with Sentry from the command line using the `sentry` CLI tool.

## Prerequisites

The CLI must be installed and authenticated before use. If `sentry` is not found in the system, provide the user with installation instructions below, but do not attempt to install it automatically.

```bash
curl https://cli.sentry.dev/install -fsS | bash
brew install getsentry/tools/sentry

# Or install via npm/pnpm/bun
npm install -g sentry
```

## Viewing Sentry issues

### `sentry issue list <org/project>`

List issues in a project

**Flags:**
- `-q, --query <value> - Search query (Sentry search syntax)`
- `-n, --limit <value> - Maximum number of issues to list - (default: "25")`
- `-s, --sort <value> - Sort by: date, new, freq, user - (default: "date")`
- `--json - Output JSON`
- `-c, --cursor <value> - Pagination cursor — only for <org>/ mode (use "last" to continue)`

**Examples:**

```bash
# Explicit org and project
sentry issue list <org>/<project>

# All projects in an organization
sentry issue list <org>/

# Search for project across all accessible orgs
sentry issue list <project>

# Auto-detect from DSN or config
sentry issue list

# List issues in a specific project
sentry issue list my-org/frontend

sentry issue list my-org/

sentry issue list frontend

sentry issue list my-org/frontend --query "TypeError"

sentry issue list my-org/frontend --sort freq --limit 20

# Show only unresolved issues
sentry issue list my-org/frontend --query "is:unresolved"

# Show resolved issues
sentry issue list my-org/frontend --query "is:resolved"

# Combine with other search terms
sentry issue list my-org/frontend --query "is:unresolved TypeError"
```

### `sentry issue view <issue>`

View details of a specific issue

**Flags:**
- `--json - Output as JSON`
- `-w, --web - Open in browser`
- `--spans <value> - Span tree depth limit (number, "all" for unlimited, "no" to disable) - (default: "3")`

**Examples:**

```bash
# By issue ID
sentry issue view <issue-id>

# By short ID
sentry issue view <short-id>

sentry issue view FRONT-ABC

sentry issue view FRONT-ABC -w
```

## Viewing Sentry events

### `sentry event view <args...>`

View details of a specific event

**Flags:**
- `--json - Output as JSON`
- `-w, --web - Open in browser`
- `--spans <value> - Span tree depth limit (number, "all" for unlimited, "no" to disable) - (default: "3")`

**Examples:**

```bash
sentry event view <event-id>

sentry event view abc123def456

sentry event view abc123def456 -w
```