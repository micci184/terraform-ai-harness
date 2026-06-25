# Terraform Project Guidelines

Use this skill when creating, modifying, or reviewing Terraform code in this repository.

## Purpose

This skill defines project-specific Terraform rules for AI-assisted infrastructure development.

## Required References

Read the following references before making Terraform changes:

- `references/directory-layout.md`
- `references/module-design.md`
- `references/expression-style.md`
- `references/state-boundary.md`
- `references/backend.md`
- `references/cross-state-values.md`
- `references/local-execution-policy.md`
- `references/plan-and-check.md`

## Core Rules

- Do not use Terraform CLI workspaces.
- Keep child modules flat.
- Do not nest project child modules.
- Put component resources in child modules.
- Put connection resources in root modules.
- Use `connectivity.tf` for Security Group Rules.
- Use `routing.tf` for ALB Listener Rules.
- Prefer `for_each` for multiple resources.
- Use `count` only for optional 0-or-1 resources.
- Keep conditional expressions simple; move complex conditions into `locals`.
- Use module outputs for same-state values.
- Use SSM Parameter Store, Secrets Manager, DNS, or provider data sources for cross-state values.
- Do not use `terraform_remote_state` unless explicitly approved.
- Use the S3 backend with `use_lockfile = true` and do not use DynamoDB lock tables.
- Use one state key per State boundary.
- Do not run `terraform destroy`, `terraform state`, `terraform force-unlock`, or `terraform workspace`.
- Do not use `-destroy`, `-replace`, `-target`, or `--target` with `terraform plan` or `terraform apply`.
