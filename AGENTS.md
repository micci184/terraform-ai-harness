# Terraform AI Harness Agent Guide

This file is the entry point for AI Agents working in this repository.

## Terraform Structure

- Do not use Terraform CLI workspaces.
- Do not call project child modules from other project child modules.
- Root modules must call child modules flatly.
- Component resources must be placed in child modules.
- Component-to-component connections must be placed in root modules.
- Security Group Rules must be placed in `connectivity.tf`.
- ALB Listener Rules must be placed in `routing.tf`.

## Values and State Boundaries

- Use module outputs for values within the same State.
- Use SSM Parameter Store or provider data sources for values across State boundaries.
- Do not use `terraform_remote_state` by default.

## Command Policy

- Do not run `terraform destroy`.
- Do not run `terraform state` commands.
- Do not run `terraform force-unlock`.
- Do not use `-target` with `terraform plan` or `terraform apply`.
- Run `scripts/check.sh` before reporting completion.
- Use `scripts/plan.sh` when a Terraform plan is needed.
