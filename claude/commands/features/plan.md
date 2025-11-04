---
allowed-tools: Bash(find:*), Bash(cat:*), Bash(grep:*), Bash(ls:*), Bash(python --version:*), Bash(pip list:*), Bash(git log --oneline:*), Bash(git branch --show-current:*), File(read:*)
description: Create comprehensive feature plan with deep technical analysis
---
## Context
- Current project structure: !`find . -type f -name "*.py" | head -20`
- Database models: !`find . -name "models.py" -o -name "schema.py" | head -5`
- API structure: !`find . -name "views.py" -o -name "routes.py" -o -name "api.py" | head -5`
- Requirements/dependencies: !`cat requirements.txt 2>/dev/null || cat pyproject.toml 2>/dev/null || echo "No requirements file found"`
- Current branch: !`git branch --show-current`
- Recent development patterns: !`git log --oneline -10`
- Test structure: !`find . -name "test_*.py" -o -name "*_test.py" | head -10`

## Your task
Perform ultrathink analysis for designing and implementing: $ARGUMENTS

Based on the project context:
1. **Deep Architecture Analysis**:
   - Review existing codebase patterns and conventions
   - Analyze current database schema and ORM usage
   - Evaluate API design patterns and authentication
   - Assess current testing framework and coverage
2. **Comprehensive Feature Design**:
   - Database schema requirements and migrations
   - API endpoint specifications with request/response formats
   - Backend service layer architecture
   - Security considerations and validation requirements
3. **Present detailed plan with**:
   - Technical specification
   - Implementation roadmap with dependencies
   - Risk assessment and mitigation strategies
   - Comprehensive testing strategy
   - Timeline estimates with milestones
4. You have the capability to call multiple tools in a single response. You MUST analyze the entire codebase context and present a thorough feature plan using maximum computational analysis.