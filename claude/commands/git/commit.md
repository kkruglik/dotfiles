---
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git add:*), Bash(git commit:*), Bash(git push:*), Bash(git branch --show-current:*)
description: Create a conventional commit with all current changes and push to remote repository
---
## Context
- Current git status: !`git status`
- Current branch: !`git branch --show-current`
- Current changes: !`git diff`
- Staged changes: !`git diff --staged`

## Your task
Based on the above changes:
1. Stage all changes with `git add -A`
2. Analyze the changes and create a conventional commit with appropriate type:
  - `feat:` for new features
  - `fix:` for bug fixes
  - `docs:` for documentation changes
  - `style:` for formatting changes
  - `refactor:` for code refactoring
  - `test:` for adding tests
  - `chore:` for build tasks, dependency updates
3. Create commit with descriptive message following Conventional Commits specification
4. Push to the current branch with `git push`
5. You have the capability to call multiple tools in a single response. You MUST do all of the above in a single message. Do not use any other tools or do anything else. Do NOT add co-authors to the commit message.