# Terraform Templates

This directory contains copyable Terraform skeletons.

Use these templates as a starting point when creating implementation code under
`terraform/`.

## Templates

- `terraform-root-module/` is for State boundary root modules such as
  `terraform/env/dev/ap-northeast-1/network`.
- `terraform-child-module/` is for flat project child modules such as
  `terraform/modules/vpc`.

## Rules

- Templates are not apply targets.
- Copy templates into `terraform/` before using them.
- Keep real implementation code under `terraform/`.
- Keep reference examples under `examples/`.
- Keep reusable project child modules under `terraform/modules/`.
