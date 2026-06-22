#!/usr/bin/env bash
set -euo pipefail

target_dir="${1:-.}"

echo "==> terraform fmt"
terraform fmt -check -recursive "${target_dir}"

echo "==> terraform validate"
validate_dirs_file="$(mktemp)"
trap 'rm -f "${validate_dirs_file}"' EXIT

while IFS= read -r tf_file; do
  dirname "${tf_file}"
done < <(
  find "${target_dir}" \
    -type d -name .terraform -prune \
    -o -type f -name '*.tf' -print
) | sort -u > "${validate_dirs_file}"

if [[ ! -s "${validate_dirs_file}" ]]; then
  echo "No Terraform files found; skipping validate."
else
  while IFS= read -r terraform_dir; do
    echo "==> terraform validate (${terraform_dir})"
    terraform -chdir="${terraform_dir}" init -backend=false -input=false
    terraform -chdir="${terraform_dir}" validate
  done < "${validate_dirs_file}"
fi

echo "==> tflint"
tflint --init
tflint --recursive

echo "==> trivy"
trivy config \
  --exit-code 1 \
  --severity CRITICAL,HIGH \
  "${target_dir}"

echo "PASS: Terraform checks completed."
