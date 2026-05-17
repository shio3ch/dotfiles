#!/usr/bin/env bash
set -euo pipefail

os="${1:-linux}"
repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
expected_dir="$repo_root/tests/expected/$os"
expected_file="$expected_dir/apply-dry-run.json"

mkdir -p "$expected_dir"
"$repo_root/scripts/chezmoi-dry-run.sh" "$os" > "$expected_file"
printf '期待値を更新しました: %s\n' "$expected_file"
