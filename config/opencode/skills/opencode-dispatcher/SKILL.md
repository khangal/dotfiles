---
name: opencode-dispatcher
description: Launch an isolated OpenCode task in a new git worktree and tmux target via the local `ocd` CLI. Use when the user asks to spawn, dispatch, launch, or start a separate task workspace.
---

# OpenCode Dispatcher

Use this skill when the user wants a new isolated task lane rather than continuing in the current session.

## What this skill does

- Creates a new git worktree for the task
- Chooses a tmux launch target: window, session, or pane split
- Starts a new `opencode` process in that worktree
- Reports the created branch, worktree path, and tmux target back to the user

## When to use it

- The user says things like `launch a task`, `spawn an agent`, `dispatch this work`, or `open a separate worktree`
- The user wants Claude-style task isolation
- The current task should continue in a separate session instead of the current one

## Dispatcher rules

- Treat the current session as the dispatcher only
- Do not try to perform the actual implementation work in the current session after dispatching
- The spawned `opencode` session is the worker that should do the coding
- If the task description is already clear, do not ask follow-up questions before dispatching
- If launch mode is not specified, prefer:
  - `--window` when already inside tmux
  - `--session` when outside tmux

## Command pattern

Run the local CLI from the repo root or any directory inside the target git repo.

```bash
ocd new "<task name>"
```

Examples:

```bash
ocd new "improve test coverage"
ocd new "broker ban flow" --pane right
ocd new "kyc api cleanup" --session
ocd new "harbor form validation" --window
ocd new "investigate flaky tests" --no-launch
```

## Response pattern

After running the dispatcher command, tell the user:

- task name
- branch name
- worktree path
- tmux target or attach command

Keep it short. Do not paste raw command output unless it is needed to explain an error.

## Important limitations

- This skill assumes `ocd` is already installed and on `PATH`
- This skill does not automatically inject the user task into the new `opencode` session yet
- If the user wants the spawned session to start with a task prompt automatically, that must be added to the CLI later
