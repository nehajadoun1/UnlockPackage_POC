#!/usr/bin/env bash
# Detects which known package FOLDERS changed between two refs — for PR
# validation only. Deliberately does NOT read sfdx-project.json: validation
# just needs to know which folder to point `sf project deploy validate` at,
# not the package's name, version, or dependencies. That project.json-aware
# logic lives in detect-changed-packages.sh, used only post-merge in
# deploy-to-qa.yml where package identity actually matters.
#
# Update PACKAGE_PATHS below if package folders are added/renamed.
#
# Usage: ./detect-changed-paths.sh <base-ref> <head-ref>
# Outputs a JSON array of paths, e.g. ["packages/data","packages/application"]

set -euo pipefail

BASE_REF="${1:-origin/main}"
HEAD_REF="${2:-HEAD}"

PACKAGE_PATHS=("packages/data" "packages/application")

CHANGED_FILES=$(git diff --name-only "$BASE_REF" "$HEAD_REF")

CHANGED_PATHS=()
for path in "${PACKAGE_PATHS[@]}"; do
  if echo "$CHANGED_FILES" | grep -q "^${path}/"; then
    CHANGED_PATHS+=("\"$path\"")
  fi
done

if [ ${#CHANGED_PATHS[@]} -eq 0 ]; then
  echo "[]"
else
  IFS=,
  echo "[${CHANGED_PATHS[*]}]"
fi
