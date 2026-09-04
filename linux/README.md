# Linux (Ubuntu/Debian) profile

Minimal, headless-friendly subset of these dotfiles: **nvim, tmux, herdr, lazygit, git + CLI utilities**.

Deliberately **not** included: homebrew casks, karabiner, skhd, sublime, kitty, vscode, k9s.

## Install

```bash
git clone --recurse-submodules <this-repo> ~/dotfiles
cd ~/dotfiles

./linux/bootstrap.sh   # install binaries (apt + GitHub releases)
./install.linux        # symlink configs via dotbot
```

Then open tmux and press `C-a I` to install tmux plugins via tpm.

Run `herdr` to start the agent multiplexer — its keybindings mirror the tmux ones
(same `C-a` prefix, `%`/`"` splits, `hjkl` pane focus, `g` = lazygit, `o` = opencode).
See `../herdr/config.toml`.

## What bootstrap.sh installs

| Source | Packages |
|---|---|
| apt | `fish tmux ripgrep fd-find bat jq tree htop fzf xclip wl-clipboard build-essential python3` |
| tarball → `/opt/nvim` | `neovim` (stable; apt's version is too old for this config) |
| GitHub release | `lazygit`, `git-delta` |
| apt repo | `gh` (GitHub CLI) |
| install script → `~/.local/bin` | `herdr` (agent multiplexer; updates via `herdr update`) |
| git clone | `tpm` (tmux plugin manager) |
| fisher | plugins from `../fisher_list` |

Sub-commands: `./linux/bootstrap.sh apt|nvim|lazygit|herdr` to run just one part.
Set `SKIP_FISH_DEFAULT=1` to skip `chsh` to fish.

Ubuntu names two binaries differently; bootstrap symlinks them into `~/.local/bin`:
`fdfind → fd`, `batcat → bat`.

## What gets linked

`linux/install.conf.yaml`:

```
~/.config/nvim              -> nvim/
~/.tmux.conf                -> .tmux.conf
~/.gitconfig                -> .gitconfig
~/.gitignore_global         -> .gitignore
~/.config/lazygit/config.yml-> lazygit/config.yml
~/.config/fish/config.fish  -> linux/fish/config.fish
~/.config/fish/aliases.fish -> linux/fish/aliases.fish
~/.config/herdr/config.toml -> herdr/config.toml
~/.local/bin/session.sh     -> scripts/session.sh
```

## Cross-platform notes

Shared files are OS-aware, so the same file works on macOS and Linux:

- **`.tmux.conf`** — `default-shell` is picked via `if-shell`:
  `/opt/homebrew/bin/fish` → `/usr/bin/fish` → `/bin/bash`.
  `gitmux` in the status bar is guarded with `command -v`, so it degrades silently.
- **`.gitconfig`** — `core.excludesfile` is `~/.gitignore_global` (was a hardcoded
  `/Users/antonio` path).
- **`nvim/lua/config/keymaps.lua`** — `<leader>to` / `<leader>of` use `open -a` on macOS
  and `xdg-open` on Linux.

Fish config is **forked** rather than shared (`linux/fish/`), because the macOS one is
heavy on homebrew paths, `pbcopy`, orbstack and mac-only apps. The Linux version
auto-detects `wl-copy` vs `xclip` and aliases `pbcopy`/`pbpaste` accordingly.

## Optional extras

Not installed by default — add if you need them:

- **Node/npm** (needed by mason for `ts_ls`, `marksman`, etc.): install via
  [volta](https://volta.sh), `fnm`, or `mise`. `config.fish` activates `mise`/`asdf`
  automatically when present.
- **Clojure** (`clojure-lsp`, `babashka`) — not in the minimal profile.
- **gitmux** — `go install github.com/arl/gitmux@latest`, then add
  `~/.config/tmux/gitmux.conf`.

## Verified on

Ubuntu 24.04 (arm64 + x86_64), nvim v0.12.x — dotbot links, fish startup, tmux config
load, and `Lazy! sync` of all plugins all pass in a clean container.
