#!/usr/bin/env bash
set -euo pipefail

payload="$(cat)"
command_text="$(printf '%s' "${payload}" | jq -er '.command')"

terraform_command_pattern='(^|[[:space:]])terraform([[:space:]]|$)'
subcommand_deny_pattern='terraform([[:space:]]+-chdir=[^[:space:]]+)?[[:space:]]+(destroy|state|force-unlock|workspace)([[:space:]]|$)'
flag_deny_pattern='(^|[[:space:]])--?(target|destroy|replace)(=|[[:space:]]|$)'

if printf '%s' "${command_text}" | grep -Eq "${subcommand_deny_pattern}" ||
  {
    printf '%s' "${command_text}" | grep -Eq "${terraform_command_pattern}" &&
      printf '%s' "${command_text}" | grep -Eq "${flag_deny_pattern}"
  }; then
  printf '%s\n' '{"permission":"deny"}'
  exit 2
fi

printf '%s\n' '{"permission":"allow"}'
