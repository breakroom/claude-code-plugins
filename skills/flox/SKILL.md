---
name: flox
description: A skill to manage and interact with the Flox environment, including activating environments, running tests, and managing dependencies. Use whenever you need to execute bash commands or use services.
---

# Flox

Flox is a tool for managing development environments. We use it to manage services and dependencies, and ensure consistency between different developers and worktrees.

If the `FLOX_ENV_PROJECT` environment variable is present and is set to the current working directory, you are in the correct Flox shell and you can execute bash commands as normal. You may still need to manage the services (see below).

If `FLOX_ENV_PROJECT` is not present or set to a different directory, but the `flox` binary is in the path, you can use it to run one off commands through Flox. Prefix commands with `flox activate -- command` to run them within the correct Flox environment.

If the `flox` binary is not available, you may experience issues with missing dependencies or services when running commands. In this case, inform the user that `flox` is not available and suggest installing it. Depending on your task you may be able to continue, but you will find some things do not work correct, e.g. running unit tests.

## Services

Flox manages the background services that are required for development: Postgres, OpenSearch, Redis and more. Tests require these services to be running to execute correctly. If you encounter issues with tests not running correctly, check that the services are running.

`flox services status` will show you the status of the services, and `flox services start` will start them if they are not running. If you're cleaning up a git worktree, use `flox services stop` to stop the services before removing it. Do not do this unless you're cleaning up a worktree.

If you just want to run a one-off command that requires the services to be running, you can prefix it with `flox activate -s --` to ensure the services are enabled for that command.
