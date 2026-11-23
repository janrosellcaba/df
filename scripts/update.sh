#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")/.."

# safety: ~/.config is linked to this repo, so never leave main
[[ "$(git branch --show-current)" == "main" ]] || { echo "ERROR: not on main. run: git switch main"; exit 1; }

mkdir -p pkglist wallpapers
pacman -Qqen > pkglist/official.txt
pacman -Qqem > pkglist/aur.txt
cp -u ~/img/wallpapers/1.jpg wallpapers/1.jpg
git add -A

# safety: look for secrets in the new lines
if git diff --cached -U0 | grep -E '^\+' | grep -i -E 'api[_-]?key|secret|passw|BEGIN [A-Z ]*PRIVATE KEY|ghp_|sk-[A-Za-z0-9]{20}'; then
  echo "WARNING: possible secret in the lines above."
  read -rp "continue anyway? [y/N] " a
  [[ "$a" == "y" ]] || { git reset -q; echo "aborted."; exit 1; }
fi

# safety: no big files (except wallpapers)
big=$(git diff --cached --name-only --diff-filter=AM | grep -v '^wallpapers/' | xargs -r -d '\n' du -k | awk '$1>10240' || true)
[[ -z "$big" ]] || { echo "ERROR: file(s) bigger than 10MB:"; echo "$big"; git reset -q; exit 1; }

if git diff --cached --quiet; then echo "nothing to update."; exit 0; fi
git status --short
read -rp "commit message [update $(date +%F)]: " msg
git commit -q -m "${msg:-update $(date +%F)}"
git push -u origin HEAD
