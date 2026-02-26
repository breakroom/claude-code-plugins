---
name: fix-issue
description: Fetches and fixes a specific issue from the issue tracker. Use when you have a specific Linear issue, and you want to automate the process of fetching the issue details and applying a fix.
disable-model-invocation: true
---

Fix the Linear issue $ARGUMENTS.

1. Fetch the issue details using Linear
2. Understand the requirements
3. Implement the fix, including tests where possible
4. Commit the change, referencing the Linear issue number in the commit message
5. Create a draft pull request and assign it to the current user for review
