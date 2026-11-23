# df - my dotfiles for arch linux

- `config/` 
- `wallpapers/`
- `pkglist/`    -> pacman & aur packages
- `scripts/`    -> `update.sh` (save changes) · `install.sh` (restore)

## save changes (alias)
    dfu

## on new pc
    git clone git@github.com:janrosellcaba/df.git ~/df
    ~/df/scripts/install.sh --dry-run   # check everything is correct
    ~/df/scripts/install.sh

## ⚠️ important
`~/.config` is linked to this repo with stow, so the repo IS my live config.
**never** run `git switch`, `checkout` or `reset --hard` in `~/df`. always stay on `main`.
to look at old versions use `git show <tag>:path` or clone into `/tmp`.
