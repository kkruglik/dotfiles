---
allowed-tools: Bash(find:*), Bash(cat:*), Bash(grep:*), Bash(ls:*), Bash(git log --oneline:*), Bash(git branch --show-current:*), Bash(python -m bandit:*), Bash(pip list:*), File(read:*)
description: Comprehensive security vulnerability analysis with deep threat modeling
---
## Context
- Current project structure: !`find . -type f -name "*.py" | head -20`
- Authentication/auth files: !`find . -name "*auth*" -o -name "*login*" -o -name "*security*" | head -10`
- Database models and queries: !`find . -name "models.py" -o -name "*query*" -o -name "*db*" | head -10`
- API endpoints: !`find . -name "views.py" -o -name "routes.py" -o -name "*api*" | head -10`
- Configuration files: !`find . -name "settings.py" -o -name "config.py" -o -name "*.env*" -o -name "*.ini" | head -10`
- Requirements/dependencies: !`cat requirements.txt 2>/dev/null || cat pyproject.toml 2>/dev/null || echo "No requirements file found"`
- Current branch: !`git branch --show-current`
- Security-related imports: !`grep -r "import.*auth\|import.*security\|import.*crypto" . --include="*.py" | head -10`

## Your task
Perform comprehensive security analysis for: $ARGUMENTS

Based on the project context:
1. **Code-Level Security Analysis**:
  - Scan for SQL injection vulnerabilities in database queries
  - Identify XSS attack vectors in user input handling
  - Review authentication and authorization implementations
  - Analyze input validation and sanitization patterns
  - Check output encoding and data serialization
2. **Architecture Security Review**:
  - Map data flow and identify security boundaries
  - Analyze API endpoint exposure and access controls
  - Review database access patterns and permissions
  - Assess third-party integration security
  - Evaluate configuration and secrets management
3. **Threat Modeling Analysis**:
  - Map attack surface and entry points
  - Identify framework-specific vulnerabilities
  - Analyze business logic security flaws
  - Review session management and token handling
4. **Present comprehensive security assessment with**:
  - Prioritized vulnerability list with CVSS scores
  - Specific remediation recommendations
  - Secure code examples and patterns
  - Security testing strategy and tools
5. You have the capability to call multiple tools in a single response. You MUST analyze the entire codebase for security vulnerabilities and present a thorough security assessment.