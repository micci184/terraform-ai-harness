#!/usr/bin/env bash
set -euo pipefail

target_dir="${1:-.}"

echo "==> terraform fmt"
terraform fmt -check -recursive "${target_dir}"

echo "==> tflint"
tflint --init
tflint --recursive

echo "==> trivy"
trivy config \
  --exit-code 1 \
  --severity CRITICAL,HIGH \
  "${target_dir}"

echo "PASS: Terraform checks completed."
