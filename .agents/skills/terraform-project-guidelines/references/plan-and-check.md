# Plan and Check

## Check

Run:

```bash
./scripts/check.sh <target-directory>
```

This runs:

- `terraform fmt -check -recursive`
- `terraform init -backend=false` for Terraform directories
- `terraform validate` for Terraform directories
- `tflint`
- `trivy config`

## Plan

Run:

```bash
./scripts/plan.sh <root-module-directory>
```

The plan script:

- Creates a temporary plan file
- Converts it to JSON temporarily
- Outputs a sanitized summary
- Removes temporary files
- Warns on delete or replace actions

## Strict Mode

For CI or release gates:

```bash
PLAN_STRICT=true ./scripts/plan.sh <root-module-directory>
```
