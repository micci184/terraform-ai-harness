# Directory Layout

## Repository Layout

- `examples/` contains reference examples.
- `terraform/` contains actual Terraform implementation code.
- `scripts/` contains local and CI-compatible utility scripts.
- `.cursor/` contains Cursor rules and hooks.
- `.agents/skills/` contains AI Agent skills.

## Standard Terraform Layout

The expected implementation layout is:

```text
terraform/
+-- modules/
`-- env/
    `-- dev/
        +-- global/
        |   `-- edge/
        `-- ap-northeast-1/
            +-- network/
            +-- app/
            +-- data/
            `-- data-sync/
```

## Rules

- Use directory-based environment separation.
- Do not use Terraform CLI workspaces.
- Keep examples separate from real implementation.
