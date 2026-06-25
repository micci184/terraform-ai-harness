# Terraform AI Harness

This repository is a Terraform AI Harness.

It provides rules, scripts, and reference examples so that AI Agents and humans can work with Terraform safely.

## Standard Pattern

The standard sample pattern assumes:

- 1 AWS account
- Primary Region: ap-northeast-1
- Public access
- CloudFront + CloudFront WAF
- ALB + ECS Fargate
- Aurora

## Directory Roles

- `examples/` is for reference examples and learning material.
- `templates/` is for copyable skeletons.
- `terraform/` is for actual Terraform implementation code.

Do not treat `examples/` as the default apply target.
Do not treat `templates/` as the default apply target.

## State Backend

- Use the S3 backend for all root modules.
- Do not use DynamoDB for state locking.
- Use S3 native locking with `use_lockfile = true` (Terraform 1.10+).
- Use one state key per State boundary.

## Required Tools

- Terraform
- TFLint
- Trivy
- jq

The Cursor shell hook uses `jq` to parse shell execution payloads.

## Safety Rules

- Do not use Terraform CLI workspaces.
- Do not run `terraform destroy`.
- Do not run `terraform state` commands.
- Do not run `terraform force-unlock`.
- Do not run `terraform workspace` commands.
- Do not use `-destroy`, `-replace`, `-target`, or `--target` with `terraform plan` or `terraform apply`.
