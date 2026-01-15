# Semantic Debugging Skill

## When to Apply
- Bug reports with unclear root cause
- Unexpected behavior in production
- Test failures that don't point to obvious issues
- Performance regressions
- Intermittent or flaky failures

## Four-Phase Debugging Protocol

### Phase 1: Reproduce
**Goal**: Confirm the bug exists and create reliable reproduction steps.

- Gather all available evidence (logs, stack traces, user reports)
- Create minimal reproduction case
- Document exact steps to trigger the issue
- Identify environment factors (OS, versions, config)
- Verify the bug occurs consistently

**Exit criteria**: Bug reproduces reliably with documented steps.

### Phase 2: Isolate
**Goal**: Narrow down the problem space.

- Use binary search on code changes (git bisect)
- Isolate components by disabling/mocking dependencies
- Add targeted logging at suspected boundaries
- Test with minimal configuration
- Eliminate environmental factors

**Techniques**:
- Comment out code blocks to find trigger
- Add assertions at function boundaries
- Compare working vs broken state
- Check recent changes in affected area

**Exit criteria**: Problem isolated to specific component/function.

### Phase 3: Analyze
**Goal**: Understand the root cause, not just symptoms.

- Trace data flow through the isolated code
- Check assumptions with explicit assertions
- Review edge cases and boundary conditions
- Examine state at each step
- Question "obvious" code - bugs hide in plain sight

**Ask these questions**:
- What state is assumed but not verified?
- What happens with empty/null/zero input?
- Are there race conditions or timing issues?
- Is error handling masking the real problem?
- What changed recently in this area?

**Exit criteria**: Root cause identified with evidence.

### Phase 4: Verify
**Goal**: Confirm fix and prevent regression.

- Implement minimal fix addressing root cause
- Verify reproduction case no longer fails
- Run full test suite for regressions
- Add test case covering the bug
- Check for similar patterns elsewhere

**Verification checklist**:
- [ ] Original bug no longer reproduces
- [ ] New test case added and passes
- [ ] No new test failures introduced
- [ ] Fix addresses root cause, not symptom
- [ ] Similar code checked for same issue

## Anti-Patterns to Avoid

- **Shotgun debugging**: Random changes hoping something works
- **Symptom fixing**: Patching the symptom instead of cause
- **Assumption traps**: Trusting code does what it says
- **Tunnel vision**: Focusing too narrow too early
- **Premature optimization**: Fixing perceived issues before confirming

## Debug Output Standards

When reporting findings:

```
## Bug Summary
[One sentence description]

## Reproduction Steps
1. [Step]
2. [Step]
3. [Observed behavior]
4. [Expected behavior]

## Root Cause
[Explanation of why the bug occurs]

## Evidence
[Code snippets, logs, or traces proving the cause]

## Fix
[Minimal change addressing root cause]

## Regression Test
[Test case that would catch this bug]
```

## Escalation Criteria

Escalate to collaborative mode when:
- Bug involves security or data integrity
- Root cause spans multiple systems
- Fix requires architectural changes
- Unable to reproduce after reasonable effort
- Fix has high risk of side effects
