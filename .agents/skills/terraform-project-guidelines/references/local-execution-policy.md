# Local Execution Policy

## Allowed Commands

- `terraform init`
- `terraform fmt`
- `terraform validate`
- `terraform plan`
- `terraform apply`

## Denied Commands

- `terraform destroy`
- `terraform state *`
- `terraform force-unlock`
- `terraform plan -target=...`
- `terraform apply -target=...`

## Workspace

Do not use Terraform CLI workspaces.

Use directory-based environment separation.
