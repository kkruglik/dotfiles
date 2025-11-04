---
allowed-tools: Bash(git diff:*), Bash(git log --oneline:*), Bash(find:*), Bash(grep:*), Bash(cat:*), Bash(ls:*), Bash(head:*), Bash(tail:*), Bash(wc:*), Bash(git branch --show-current:*)
description: Perform a comprehensive code review of recent changes
---
## Context
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -5`
- Current changes: !`git diff HEAD~1`
- Modified Python files: !`git diff --name-only HEAD~1 | grep "\.py$"`
- Project structure: !`find . -name "*.py" -type f | head -20`

## Your task
Based on the above changes:
1. Review all modified Python files for:
  - PEP 8 compliance and coding conventions
  - Proper error handling and exception management
  - Loading states and user feedback patterns
  - Security vulnerabilities (SQL injection, XSS, input validation)
  - Performance implications (loops, database queries, memory usage)
2. Check if documentation needs updates:
  - README.md changes required
  - Docstrings added/updated for new functions
  - API documentation updates
3. Validate test coverage for new code
4. Review CLAUDE.md for existing patterns and update with any new patterns discovered
5. You have the capability to call multiple tools in a single response. You MUST analyze all aspects in a single message and provide a comprehensive review summary with specific recommendations.