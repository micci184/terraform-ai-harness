#!/usr/bin/env bash
set -euo pipefail

payload="$(cat)"
command_text="$(printf '%s' "${payload}" | jq -er '.command')"

deny_pattern='terraform([[:space:]]+-chdir=[^[:space:]]+)?[[:space:]]+(destroy|state|force-unlock)([[:space:]]|$)|(^|[[:space:]])-target(=|[[:space:]])'

if printf '%s' "${command_text}" | grep -Eq "${deny_pattern}"; then
  printf '%s\n' '{"permission":"deny"}'
  exit 0
fi

printf '%s\n' '{"permission":"allow"}'
