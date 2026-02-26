#!/bin/bash

CWD=$(jq -r '.cwd' < /dev/stdin)

if [ "$FLOX_ENV_PROJECT" = "$CWD" ]; then
  echo '{"continue": true}'
else
  cat <<'EOF'
{"continue": true, "systemMessage": "Warning: You are not in the correct Flox environment for this project. Run 'flox activate' in the project directory to enter the development environment, then restart Claude Code.", "hookSpecificOutput": {"hookEventName": "SessionStart", "additionalContext": "The Flox environment is not active or is set to a different project. Use the /flox skill for guidance on how to run commands in this state."}}
EOF
fi
