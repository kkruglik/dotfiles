---
allowed-tools: Bash(find:*), Bash(ls:*), Bash(git log:*), Bash(git branch:*), Bash(git show:*), File(read:*)
description: Deep codebase exploration and analysis before implementation (read-only)
---
## Context
- Current branch: !`git branch --show-current`
- Project structure: !`find . -type f \( -name "*.py" -o -name "*.ts" -o -name "*.js" -o -name "*.go" -o -name "*.rs" \) | head -25`
- Recent commits: !`git log --oneline -15`
- Directory layout: !`ls -la`

## Your Task
Investigate and analyze: $ARGUMENTS

This is a **READ-ONLY research phase**. You must NOT modify any files.

### Research Protocol

1. **Codebase Mapping**
   - Identify all files relevant to the investigation topic
   - Trace data flow and execution paths
   - Map dependencies and interfaces between components
   - Document architectural patterns in use

2. **Pattern Analysis**
   - How is similar functionality implemented elsewhere?
   - What conventions does this codebase follow?
   - Are there reusable utilities or abstractions?
   - What testing patterns are established?

3. **Dependency Tracing**
   - What external libraries are involved?
   - What internal modules are affected?
   - Are there database schemas or migrations?
   - What configuration is required?

4. **Risk Assessment**
   - What could break with changes to this area?
   - Are there hidden dependencies or side effects?
   - What edge cases exist?
   - Are there performance considerations?

### Output Format

Provide a structured research report:

```
## Summary
[2-3 sentence overview of findings]

## Key Files
- path/to/file.py - [purpose and relevance]

## Architecture
[How the relevant components are structured]

## Patterns Identified
[Coding conventions and patterns to follow]

## Dependencies
[Internal and external dependencies]

## Risks & Considerations
[What to watch out for during implementation]

## Recommended Approach
[Based on findings, how should implementation proceed]
```

You MUST read all relevant files thoroughly. Do NOT make assumptions - verify everything through code inspection.
