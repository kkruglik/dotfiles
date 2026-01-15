# Subagent-Driven Development Skill

## When to Apply
- Complex features requiring multiple implementation steps
- Changes spanning multiple files or systems
- Tasks benefiting from separation of concerns (implement vs review)
- High-risk modifications requiring verification
- Large refactoring efforts

## Core Principle

Split complex work into specialized phases with distinct responsibilities. Each phase has clear inputs, outputs, and success criteria. This prevents context pollution and ensures focused execution.

## Two-Stage Development Pattern

### Stage 1: Implementation Agent
**Role**: Builder focused on creating the solution.

**Responsibilities**:
- Analyze requirements and existing code
- Design solution following project patterns
- Implement changes incrementally
- Write tests alongside implementation
- Document decisions and tradeoffs

**Constraints**:
- Stay focused on the defined task
- Follow established patterns - don't invent new ones
- Make smallest changes that satisfy requirements
- Don't review own work - that's Stage 2

**Output**: Working implementation with tests.

### Stage 2: Review Agent
**Role**: Critic focused on finding issues.

**Responsibilities**:
- Verify implementation matches requirements
- Check for bugs, edge cases, security issues
- Assess code quality and maintainability
- Validate tests are meaningful
- Identify potential regressions

**Constraints**:
- Assume nothing - verify everything
- Check context beyond changed files
- Apply severity classification (P0-P3)
- Only flag high-confidence issues

**Output**: Review report with actionable findings.

## Extended Pattern: Three-Stage Development

For high-risk or architectural changes:

### Stage 1: Research Agent
- Explore codebase and dependencies
- Identify patterns and constraints
- Map affected components
- Document findings

### Stage 2: Implementation Agent
- Use research findings as input
- Build solution following patterns
- Implement with tests

### Stage 3: Review Agent
- Verify against research findings
- Check implementation quality
- Validate requirements met

## Task Handoff Protocol

When transitioning between stages:

```
## Handoff: [Stage N] → [Stage N+1]

### Completed
- [What was accomplished]

### Artifacts
- [Files created/modified]
- [Tests added]

### Decisions Made
- [Key choices and rationale]

### Open Questions
- [Unresolved items for next stage]

### Context for Next Stage
- [Essential information to preserve]
```

## Verification Gates

Each stage must pass verification before handoff:

**Research Gate**:
- [ ] All relevant files identified
- [ ] Patterns documented
- [ ] Dependencies mapped
- [ ] Risks assessed

**Implementation Gate**:
- [ ] Code compiles/runs
- [ ] Tests pass
- [ ] Requirements addressed
- [ ] Changes are minimal

**Review Gate**:
- [ ] All changes examined
- [ ] No P0/P1 issues found
- [ ] Tests are meaningful
- [ ] Code follows patterns

## Anti-Patterns

- **Context bleeding**: Letting implementation concerns affect research
- **Premature coding**: Starting implementation before research complete
- **Self-review**: Same agent implementing and reviewing
- **Scope creep**: Adding unrequested improvements during implementation
- **Rubber stamping**: Superficial review that misses issues

## When NOT to Use

Skip subagent approach for:
- Single-file changes
- Simple bug fixes with obvious solutions
- Documentation-only changes
- Configuration updates
- Tasks completable in one focused session

## Integration with Other Skills

- Use **semantic-debugging** in research phase for bug investigations
- Apply **review command** as Stage 2 for code changes
- Use **research command** as Stage 1 for new features
