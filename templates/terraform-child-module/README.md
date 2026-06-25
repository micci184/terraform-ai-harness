# Terraform Child Module Template

Copy this directory when creating a flat project child module.

Example targets:

```text
terraform/modules/vpc
terraform/modules/alb
terraform/modules/ecs_service
terraform/modules/aurora
```

After copying, rename `*.tf.tmpl` files to `*.tf` and replace placeholder values.

## Rules

- Child modules own component resources.
- Child modules must not call other project child modules.
- Child modules should output IDs, ARNs, and names needed by root modules.
- Security Group resources may live in child modules.
- Security Group Rules must live in root module `connectivity.tf`.
- ALB Listener Rules must live in root module `routing.tf`.
