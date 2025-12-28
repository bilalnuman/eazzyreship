# 🤝 Contributing to the Project

Thank you for your interest in contributing! Below you'll find the basic guidelines for collaborating in an organized and effective way.

---

## 🌿 Branch Naming Convention

We use a clear branch naming convention to keep the codebase organized. **All branches must be created from `develop`.**

### 🏠 Main Branches

- `main`: contains production-ready (stable) code.
- `develop`: integration branch used for testing before deploying to production.

### 🚧 Working Branches

Use the following format depending on the type of work you're doing:

| Type            | Prefix       | Example                            |
|------------------|--------------|-------------------------------------|
| New feature      | `feature/`   | `feature/contact-form`              |
| Bug fix          | `fix/`       | `fix/startup-crash`                 |
| Refactor/Cleanup | `chore/`     | `chore/refactor-validations`        |
| Test/Prototype   | `test/`      | `test/button-animation`             |

---

## 🔀 Workflow

1. **Clone** the repository and create a new branch:
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/your-branch-name
