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
- `terraform/` is for actual Terraform implementation code.

Do not treat `examples/` as the default apply target.

## Safety Rules

- Do not use Terraform CLI workspaces.
- Do not run `terraform destroy`.
- Do not run `terraform state` commands.
- Do not run `terraform force-unlock`.
- Do not use `-target` with `terraform plan` or `terraform apply`.
