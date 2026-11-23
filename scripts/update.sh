#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")/.."
mkdir -p pkglist wallpapers
pacman -Qqen > pkglist/official.txt
pacman -Qqem > pkglist/aur.txt
cp -u ~/img/wallpapers/1.jpg wallpapers/1.jpg
git add -A
if git diff --cached --quiet; then echo "nothing to update."; exit 0; fi
git status --short
read -rp "commit message [update $(date +%F)]: " msg
git commit -q -m "${msg:-update $(date +%F)}"
git push
