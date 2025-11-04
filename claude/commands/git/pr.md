---
allowed-tools: Bash(git log --oneline:*), Bash(git status:*), Bash(git push:*), Bash(gh pr create:*), Bash(git branch --show-current:*), Bash(git diff:*)
description: Create a comprehensive pull request for the current branch
---

## Context
- Current git status: !`git status`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -5`
- Current git diff: !`git diff HEAD`

## Your task
Based on the above context:
1. Ensure all changes are committed and pushed to current branch
2. Analyze the recent commits to understand the changes made
3. Create a comprehensive pull request using `gh pr create` with:
  - **Summary**: Brief description of changes
  - **Changes Made**: Detailed list of modifications
  - **Breaking Changes**: Any breaking changes (if applicable)
4. Add appropriate labels and reviewers if configured
5. Set milestone if applicable
6. You have the capability to call multiple tools in a single response. You MUST do all of the above in a single message. Do not use any other tools or do anything else. Follow PR template structure and enforce title conventions.