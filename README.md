# Light.inc - DevSecOps Take-Home Challenge

Welcome! This repository is a small, self-contained "mini platform" that resembles a real setup at Light:
- AWS + EKS/Fargate
- Terraform for infrastructure
- Tanka/Jsonnet for Kubernetes manifests
- GitHub Actions CI/CD
- Kotlin (Gradle) backend + Next.js (TypeScript) frontend
- Datadog/CloudWatch observability
- SOPS + AWS Secrets Manager for secrets

> **Timebox:** ~4 hours. Partial completion is OK. Document tradeoffs and what you'd do next.

## Your tasks
1. Go through and review the provided files (app, deployment, infrastructure).
2. Highlight issues.
3. Fix as much as possible.
4. Add missing parts you believe are necessary.
5. Draw simple sketches when possible, to explain flows for example, in `docs` dir.
6. Take notes in `docs/NOTES.md`.
7. Think about observability, draft a section for that, what would you check? what would you ensure exists? etc ...

## Notes
- Don't chase perfection; choose good defaults.
- Avoid requiring paid accounts/services.
- Keep changes maintainable and well-explained.
- The code is not meant to be runnable.
- Small, meaningful commits are encouraged.

## Submitting your solution
1. Commit all your changes.
2. Run `git bundle create challenge-<your-name>.bundle --all`
3. Send us the generated bundle file
