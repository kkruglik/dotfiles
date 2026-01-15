---
allowed-tools: Bash(git diff:*), Bash(git status:*), Bash(git log:*), Bash(git show:*), Bash(git branch:*), File(read:*)
description: Comprehensive code review with severity classification
---
## Context
- Current branch: !`git branch --show-current`
- Git status: !`git status`
- Staged changes: !`git diff --staged --stat`
- Unstaged changes: !`git diff --stat`
- Recent commits on branch: !`git log --oneline -10`

## Your Task
Review the current changes: $ARGUMENTS

### Review Protocol

Analyze all changes using the following criteria:

1. **Correctness**
   - Does the code do what it's supposed to do?
   - Are there logic errors or off-by-one mistakes?
   - Are edge cases handled properly?
   - Are return values and error states correct?

2. **Security**
   - Input validation and sanitization
   - Authentication and authorization checks
   - Injection vulnerabilities (SQL, XSS, command)
   - Sensitive data exposure
   - Insecure dependencies

3. **Performance**
   - N+1 queries or unnecessary database calls
   - Memory leaks or unbounded growth
   - Blocking operations in async contexts
   - Missing indexes or inefficient algorithms

4. **Maintainability**
   - Code clarity and readability
   - Appropriate abstractions (not over/under-engineered)
   - Consistent with codebase patterns
   - Adequate error messages and logging

5. **Testing**
   - Are new code paths tested?
   - Do tests verify behavior, not implementation?
   - Are edge cases covered?
   - Is test code maintainable?

### Severity Classification

Rate each finding:

- **P0 (Critical)**: Security vulnerability, data loss risk, system crash
- **P1 (High)**: Bug that will cause incorrect behavior in production
- **P2 (Medium)**: Code smell, maintainability issue, minor bug
- **P3 (Low)**: Style inconsistency, nitpick, suggestion

### Output Format

```
## Review Summary
[Overall assessment: APPROVE / REQUEST_CHANGES / NEEDS_DISCUSSION]

## Critical Issues (P0)
- [file:line] Description and fix suggestion

## High Priority (P1)
- [file:line] Description and fix suggestion

## Medium Priority (P2)
- [file:line] Description and fix suggestion

## Suggestions (P3)
- [file:line] Description

## What's Good
- [Positive observations about the changes]

## Questions
- [Clarifications needed before approval]
```

Read ALL changed files completely. Do NOT skim or make assumptions about unchanged code. Verify context by reading surrounding code when needed.

Only report issues with **high confidence**. Do not flag speculative problems.
