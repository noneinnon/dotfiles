# dotfiles

Managed by [chezmoi](https://www.chezmoi.io). One source, macOS and Linux.

## Install

```bash
git clone <this-repo> ~/dotfiles
chezmoi init --source ~/dotfiles --apply
```

- **Linux**: also runs `run_once_bootstrap_linux.sh.tmpl` — installs nvim, lazygit,
  gh, herdr, pi, fisher plugins, CLI utils via apt + GitHub releases. Set
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
| `~/.agents/skills` | `private_dot_agents/skills` (`herdr` skill + skills.sh lock file) |
| `~/.pi/agent` | `private_dot_pi/agent` (pi settings + skills) |

## Skills

Agent skills are installed via [skills.sh](https://skills.sh) (`npx skills add <repo> -g -a pi`)
and tracked in `~/.agents/.skill-lock.json`.

- `herdr` — canonical copy in `~/.agents/skills`, symlinked into `~/.pi/agent/skills`
- [mattpocock/skills](https://github.com/mattpocock/skills) pack (~36 skills: `tdd`,
  `grill-me`, `code-review`, `diagnosing-bugs`, ...) — installed directly in
  `~/.pi/agent/skills`

Update with `npx skills update -g`, then `chezmoi re-add` the changed dirs.

## Daily workflow

- Edit: `chezmoi edit ~/.config/nvim/...`
- Apply to home: `chezmoi apply`
- After editing a file already on disk: `chezmoi re-add`

## Cheatsheets

- [fzf.fish](https://github.com/PatrickF1/fzf.fish)
- `kitty list-fonts` lists available fonts
- `kitty +kitten themes` lists & sets themes
