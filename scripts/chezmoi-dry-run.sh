#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: scripts/chezmoi-dry-run.sh [linux]

一時 HOME / config で chezmoi apply --dry-run --verbose を実行し、
Git 管理しやすい正規化済み JSON を標準出力へ出します。
Dry Run の生 diff は保存しません。
USAGE
}

os="${1:-linux}"
case "$os" in
  linux) ;;
  -h|--help) usage; exit 0 ;;
  *)
    echo "未対応の OS です: $os" >&2
    echo "現在このリポジトリで期待値を確定しているのは linux のみです。" >&2
    exit 2
    ;;
esac

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
fixture="$repo_root/tests/fixtures/$os.toml"

if ! command -v chezmoi >/dev/null 2>&1; then
  echo "chezmoi が見つかりません。先に chezmoi をインストールしてください。" >&2
  exit 127
fi

if [[ ! -f "$fixture" ]]; then
  echo "fixture config が見つかりません: $fixture" >&2
  exit 1
fi

tmpdir=$(mktemp -d)
cleanup() {
  rm -rf "$tmpdir"
}
trap cleanup EXIT

home_dir="$tmpdir/home"
raw_diff="$tmpdir/apply-dry-run.diff"
stderr_log="$tmpdir/chezmoi.stderr"
mkdir -p "$home_dir"

# stderr には chezmoi のバージョンやローカル状態に依存する警告が出る場合があるため、
# 期待値化する対象は stdout の diff のみに限定する。
if ! chezmoi \
  --source "$repo_root" \
  --destination "$home_dir" \
  --config "$fixture" \
  --no-tty \
  apply --dry-run --verbose > "$raw_diff" 2> "$stderr_log"; then
  cat "$stderr_log" >&2
  exit 1
fi

# テスト用 fixture config は .chezmoi.toml.tmpl から直接生成したものではないため、
# chezmoi が既知の警告を出すことがある。これは期待値差分と無関係なので抑制する。
if [[ -s "$stderr_log" ]]; then
  grep -v '^chezmoi: warning: config file template has changed, run chezmoi init to regenerate config file$' "$stderr_log" >&2 || true
fi

python3 - "$raw_diff" "$os" <<'PY'
import hashlib
import json
import re
import sys
from pathlib import PurePosixPath

raw_path = sys.argv[1]
os_name = sys.argv[2]

diff_header = re.compile(r"^diff --git a/(.*) b/(.*)$")
index_line = re.compile(r"^index ([0-9a-f]{40})\.\.([0-9a-f]{40})(?: (\d+))?$")
mode_line = re.compile(r"^(new|deleted) file mode (\d+)$")

entries = []
current = None
current_body = []


def normal_path(path: str) -> str:
    # chezmoi の出力は destination 相対パスだが、念のため POSIX 表現に寄せる。
    return str(PurePosixPath(path))


def finish_current():
    if current is None:
        return
    old_hash = current.pop("old_hash", None)
    new_hash = current.pop("new_hash", None)
    body = "".join(current_body).encode("utf-8")

    if old_hash == "0" * 40 and new_hash and new_hash != "0" * 40:
        current["operation"] = "create"
    elif new_hash == "0" * 40 and old_hash and old_hash != "0" * 40:
        current["operation"] = "delete"
    else:
        current["operation"] = "modify"

    # 生 diff の本文は保存しない。変更内容の同一性だけ検証するため、
    # diff ブロック単位の sha256 を保持する。
    current["diff_sha256"] = hashlib.sha256(body).hexdigest()
    entries.append(current)

with open(raw_path, "r", encoding="utf-8", errors="replace") as fh:
    for line in fh:
        match = diff_header.match(line)
        if match:
            finish_current()
            a_path, b_path = match.groups()
            current = {
                "path": normal_path(b_path if b_path != "/dev/null" else a_path),
            }
            current_body = [line]
            continue

        if current is None:
            continue

        current_body.append(line)

        match = index_line.match(line)
        if match:
            current["old_hash"] = match.group(1)
            current["new_hash"] = match.group(2)
            if match.group(3):
                current["mode"] = match.group(3)
            continue

        match = mode_line.match(line)
        if match:
            current["operation"] = "create" if match.group(1) == "new" else "delete"
            current["mode"] = match.group(2)
            continue

finish_current()

entries.sort(key=lambda item: item["path"])

result = {
    "schema": 1,
    "os": os_name,
    "command": "chezmoi apply --dry-run --verbose",
    "normalization": {
        "raw_diff": "not stored",
        "paths": "destination-relative POSIX paths",
        "content": "diff body is represented by sha256 only",
        "stderr": "excluded because it may contain local chezmoi warnings",
    },
    "entry_count": len(entries),
    "entries": entries,
}

json.dump(result, sys.stdout, ensure_ascii=False, indent=2, sort_keys=True)
sys.stdout.write("\n")
PY
