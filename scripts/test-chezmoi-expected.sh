#!/usr/bin/env bash
set -euo pipefail

os="${1:-linux}"
repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
expected_file="$repo_root/tests/expected/$os/apply-dry-run.json"
actual_file=$(mktemp)
cleanup() {
  rm -f "$actual_file"
}
trap cleanup EXIT

if [[ ! -f "$expected_file" ]]; then
  echo "期待値ファイルが見つかりません: $expected_file" >&2
  echo "先に scripts/update-chezmoi-expected.sh $os を実行してください。" >&2
  exit 1
fi

"$repo_root/scripts/chezmoi-dry-run.sh" "$os" > "$actual_file"

diff -u "$expected_file" "$actual_file"
printf 'chezmoi dry-run 期待値テストに成功しました: %s\n' "$os"
