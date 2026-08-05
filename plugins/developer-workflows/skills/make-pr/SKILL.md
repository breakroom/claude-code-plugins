---
name: make-pr
description: Open a pull request for the current branch using Breakroom's team conventions (Linear card link, What changed, Why, Screenshots/Videos). Use whenever the user asks to create, open, or raise a PR.
---

# Make a pull request

Follow these steps in order. Do not skip the information-gathering step — the template fields are short and benefit from accurate, specific content.

## 1. Gather context

The base branch for this repo is **`main`**. Do not trust local `origin/HEAD` or the session's gitStatus header — both can claim `master` on machines cloned before the rename. Always diff against `origin/main`.

Run in parallel:

- `git status` (no `-uall`)
- `git fetch origin main --quiet` — refresh `origin/main` so diffs aren't against stale state
- `git log --oneline origin/main..HEAD` — every commit unique to this branch (not just the latest)
- `git diff --stat origin/main...HEAD` — overview of what changed, by file
- `git branch --show-current`
- `gh pr view --json url,state 2>/dev/null || true` — check if a PR already exists

Use the `--stat` form for the overview — a full `git diff` on a long-lived branch can be megabytes and isn't needed to draft the body. Only read full hunks for a specific file when you need to verify a bullet's wording.

If a PR already exists for this branch, stop and tell the user. Do not silently update it.

## 2. Find the Linear card

The team usually links a Linear card. Look in this order:

1. **Commit messages** — many commits start with `BRK-1234` (e.g. `BRK-2372 Reword health insurance...`). The Linear URL is `https://linear.app/breakroom/issue/BRK-1234`.
2. **Branch name** — sometimes contains the ticket ID.
3. **The conversation** — the user may have mentioned a card.
4. **Ask the user** — use AskUserQuestion with a single text field. Offer "No Linear card" as an option for chores/refactors where one genuinely doesn't exist.

If you have a `BRK-XXXX` ID but not a title, you can fetch it via `mcp__claude_ai_Linear__get_issue` to make the link text meaningful (e.g. `[BRK-2372 Reword health insurance affordability findings copy](url)`). Keep it concise.

## 3. Draft "What changed?"

A short bulleted list (1–4 bullets) of the user-visible or behavioural changes, derived from the diff and commits. Not a commit log — group related commits into one bullet. Avoid restating file paths; describe the change.

## 4. Draft "Why?"

Two sources, in order:

1. **The conversation** — the user almost always stated a reason somewhere ("we got a bug report that…", "the design changed", "performance was bad on…"). Use that.
2. **The Linear card description**, if you fetched one.

If neither yields a clear "why", **ask the user** with AskUserQuestion before opening the PR. Don't guess or write filler like "improves the user experience".

## 5. Screenshots and videos

Look at the diff: does it touch user-facing UI? Heuristics:

- Files under `assets/`, `lib/poplar_web/**/templates/`, `lib/poplar_web/**/components/`, `lib/poplar_web/**/live/`, `.heex`, `.sface`, `.scss`, `.css`, React/TSX → **yes**, UI changed.
- Migrations, jobs (`*_job.ex`), pure context modules, tests-only → **no**, omit the screenshots section entirely (delete the heading and table).

If UI changed, ask the user via AskUserQuestion: "Add a Screenshots and Videos section?"

- **Yes** → keep the template table from `pull_request_template.md` verbatim, including the `| [Description] | [Paste here] |` placeholder row. The user pastes images directly into the GitHub description editor after the PR is opened; keeping the scaffold saves them retyping the `|-|-|` separator.
- **No** → delete the heading and table entirely.

Don't paste image URLs yourself, and don't try to write descriptions for screenshots — that's the user's job post-open.

## 6. Assemble the body

Use the template at `pull_request_template.md` verbatim as the structure. Final body should look like:

```markdown
[BRK-1234 Card title](https://linear.app/breakroom/issue/BRK-1234)

**What changed?**

- Bullet one
- Bullet two

**Why?**

Short paragraph or 1–2 bullets.

**Screenshots and Videos**
| Description | Screenshot/video |
|-|-|
| [Description] | [Paste here] |
```

Omit the Screenshots section entirely for non-UI PRs (delete the heading and table).

## 7. Title

Short, imperative, under 70 chars. If commits already follow a clear theme, summarise that — don't just copy the latest commit subject. Prefix with `BRK-XXXX` only if the team's recent merged PRs do (check `git log origin/main --oneline -20`). Otherwise leave the ticket link in the body.

## 8. Open the PR

```bash
git push -u origin <branch>  # if not already pushed
gh pr create --title "..." --body "$(cat <<'EOF'
...
EOF
)"
```

Return the PR URL to the user.

## Things to avoid

- Don't add a "Test plan" section — the template doesn't have one.
- Don't add the "Generated with Claude Code" footer unless the user asks; the template doesn't include it.
- Don't paste image URLs into the Screenshots table — the user adds images directly in GitHub's description editor after open.
- Don't skip the user prompts for missing Linear card / why / screenshots. A blank "Why?" is worse than a 10-second pause to ask.
