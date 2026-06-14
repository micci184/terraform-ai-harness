# Terraform Project Guidelines

Use this skill when creating, modifying, or reviewing Terraform code in this repository.

## Purpose

This skill defines project-specific Terraform rules for AI-assisted infrastructure development.

## Required References

Read the following references before making Terraform changes:

- `references/directory-layout.md`
- `references/module-design.md`
- `references/state-boundary.md`
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
- Use module outputs for same-state values.
- Use SSM Parameter Store, Secrets Manager, DNS, or provider data sources for cross-state values.
- Do not use `terraform_remote_state` unless explicitly approved.
- Do not run `terraform destroy`, `terraform state`, `terraform force-unlock`, or `-target`.
