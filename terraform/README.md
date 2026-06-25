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
- Use `templates/terraform-root-module/` when creating a new root module.
- Use `templates/terraform-child-module/` when creating a new project child module.
- Keep child modules flat.
- Place connection resources in root modules.
- Use `connectivity.tf` for Security Group Rules.
- Use `routing.tf` for ALB Listener Rules.
- Prefer `for_each` for multiple resources.
- Use `count` only for optional 0-or-1 resources.
- Keep conditional expressions simple and move complex conditions into `locals`.
