# dotfiles

Managed by [chezmoi](https://www.chezmoi.io). One source, macOS and Linux.

## Install

```bash
git clone <this-repo> ~/dotfiles
chezmoi init --source ~/dotfiles --apply
```

- **Linux**: also runs `run_once_bootstrap_linux.sh.tmpl` — installs nvim, lazygit,
  gh, herdr, fisher plugins, CLI utils via apt + GitHub releases. Set
  `SKIP_FISH_DEFAULT=1` to skip `chsh` to fish.
- **macOS**: applies configs only; karabiner/kitty included via
  `{{ if eq .chezmoi.os "darwin" }}` blocks in `.chezmoiignore.tmpl` and the
  fish/gitconfig templates.

## What's managed

| Target | Source |
|---|---|
| `~/.config/nvim` | `private_dot_config/nvim` |
| `~/.config/fish` | `private_dot_config/fish` (`config.fish.tmpl`, `aliases.fish.tmpl`) |
| `~/.gitconfig` | `dot_gitconfig.tmpl` (mac-only WebStorm mergetool behind OS guard) |
| `~/.gitignore` | `dot_gitignore_global` |
| `~/.tool-versions` | `dot_tool-versions` |
| `~/.config/lazygit` | `private_dot_config/lazygit` |
| `~/.config/herdr` | `private_dot_config/herdr` |
| `~/.config/karabiner` | `private_dot_config/karabiner` (mac only) |
| `~/.config/kitty` | `private_dot_config/kitty` (mac only) |

## Daily workflow

- Edit: `chezmoi edit ~/.config/nvim/...`
- Apply to home: `chezmoi apply`
- After editing a file already on disk: `chezmoi re-add`

## Cheatsheets

- [fzf.fish](https://github.com/PatrickF1/fzf.fish)
- `kitty list-fonts` lists available fonts
- `kitty +kitten themes` lists & sets themes
