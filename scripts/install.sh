#!/usr/bin/env bash
set -euo pipefail
DF="$(cd "$(dirname "$(readlink -f "$0")")/.." && pwd)"
DRY=0; [[ "${1:-}" == "--dry-run" ]] && DRY=1
say() { echo "==> $*"; }

say "pacman packages"
if ((DRY)); then echo "[dry] pacman -S --needed - < pkglist/official.txt"
else sudo pacman -S --needed --noconfirm git stow - < "$DF/pkglist/official.txt"; fi

say "aur packages (need yay)"
if ((DRY)); then echo "[dry] yay -S --needed - < pkglist/aur.txt"
elif command -v yay >/dev/null; then yay -S --needed - < "$DF/pkglist/aur.txt"
else echo "yay not installed: install it first (https://github.com/Jguer/yay) and run script again."; fi

say "wallpaper"
if ((DRY)); then echo "[dry] cp wallpapers/1.jpg ~/img/wallpapers/"
else mkdir -p ~/img/wallpapers && cp -n "$DF/wallpapers/1.jpg" ~/img/wallpapers/; fi

say "ZDOTDIR"
if ((DRY)); then echo "[dry] create ~/.zshenv if it doesn't exists"
elif [ ! -e ~/.zshenv ]; then echo 'export ZDOTDIR="$HOME/.config/zsh"' > ~/.zshenv; fi

say "config (stow)"
mkdir -p ~/.config
stow -n -v -d "$DF" -t ~/.config config
((DRY)) || stow -v -d "$DF" -t ~/.config config
say "DONE !"
