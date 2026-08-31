#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_dir"

required=(
  README.md
  SECURITY.md
  NOTICE.md
  docs/ARCHITECTURE.md
  docs/ENGINEERING-JOURNEY.md
  docs/CASE-STUDIES.md
  docs/RELIABILITY-AND-SAFETY.md
  docs/VERIFICATION.md
)

for path in "${required[@]}"; do
  test -s "$path" || { echo "missing or empty: $path" >&2; exit 1; }
done

blocked_files="$(find . -path ./.git -prune -o -type f \( \
  -name '.env*' -o -name '*.key' -o -name '*.pem' -o -name '*.token' -o \
  -name '*.secret' -o -name '*.db' -o -name '*.sqlite*' -o -name '*.log' -o \
  -name '*.bak' -o -name '*.backup' -o -name '*.zip' -o -name '*.tar*' -o \
  -name '*.bin' -o -name '*.safetensors' -o -name '*.gguf' \
  \) -print)"
test -z "$blocked_files" || {
  echo "blocked artifact type:" >&2
  echo "$blocked_files" >&2
  exit 1
}

if git grep -I -E '(/home/|/Users/|[A-Za-z]:\\Users\\|wilsonsyah|wilsonsyahlie|Wilson Syah|[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}|100\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}|192\.168\.[0-9]{1,3}\.[0-9]{1,3}|10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}|BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY|gh[pousr]_[A-Za-z0-9_]{20,}|sk-[A-Za-z0-9]{20,})' -- . ':!scripts/check_showcase.sh'; then
  echo "privacy pattern found" >&2
  exit 1
fi

if git log --format='%ae%n%ce' | grep -Ev '^(wilsonsyahlie@users\.noreply\.github\.com)$' | grep -q .; then
  echo "non-noreply commit identity found" >&2
  exit 1
fi

python3 - <<'PY'
from pathlib import Path
import re

root = Path('.')
for md in root.rglob('*.md'):
    text = md.read_text(encoding='utf-8')
    for target in re.findall(r'\[[^]]+\]\(([^)]+)\)', text):
        if '://' in target or target.startswith('#'):
            continue
        resolved = (md.parent / target.split('#', 1)[0]).resolve()
        if not resolved.exists():
            raise SystemExit(f'broken relative link: {md}: {target}')
PY

git diff --check
echo "showcase checks passed"

