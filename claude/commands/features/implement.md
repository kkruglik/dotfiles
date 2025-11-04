---
allowed-tools: Bash(mkdir:*), Bash(touch:*), Bash(cat:*), Bash(ls:*), Bash(find:*), Bash(grep:*), Bash(git status:*), Bash(git add:*), Bash(git commit:*), Bash(python -m pytest:*), Bash(python -m mypy:*), Bash(git branch --show-current:*), File(read:*), File(write:*)
description: Implement the approved feature with full Python development workflow
---
## Context
- Current branch: !`git branch --show-current`
- Project structure: !`find . -type f -name "*.py" | head -15`
- Current git status: !`git status`
- Requirements files: !`find . -name "requirements*.txt" -o -name "pyproject.toml" -o -name "setup.py"`
- Existing test files: !`find . -name "test_*.py" -o -name "*_test.py" | head -10`
- Python version: !`python --version`

## Your task
Implement the approved feature: $ARGUMENTS

Based on the project context:
1. Review existing codebase structure and Python patterns
2. Create necessary files and directory structure following project conventions
3. Implement core functionality with:
  - Proper type hints and docstrings
  - Comprehensive error handling and validation
  - Logging and debugging support
  - Following PEP 8 and project coding standards
4. Add comprehensive tests using pytest (unit and integration)
5. Update documentation:
  - Docstrings for all public functions/classes
  - README updates if needed
  - Module documentation
6. Run quality checks: `python -m black --check`, `python -m mypy`, `python -m pytest`
7. Create meaningful conventional commits for each logical change
8. You have the capability to call multiple tools in a single response. You MUST implement the complete feature workflow in a single message, following Python best practices and project quality standards.