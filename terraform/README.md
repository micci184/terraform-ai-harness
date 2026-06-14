# Terraform Implementation

This directory is intended for actual Terraform implementation code when this repository is used as a project template.

Expected layout:

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

Rules:

- Use directory-based environment separation.
- Do not use Terraform CLI workspaces.
- Keep child modules flat.
- Place connection resources in root modules.
- Use `connectivity.tf` for Security Group Rules.
- Use `routing.tf` for ALB Listener Rules.
