## Basic usage

### Updating Brewfile

There are handly alliases in`fish/aliases.fish`, that can be used to update Brewfile:
1. `brewup` - installs deps from `~/dotfiles/Brewfile`
2. `brewdump` - updates Brewfile in `/dotfiles/Brewfile`

## Installation

### macOS

1. Run `brewup`
2. Run `sh install`

### Linux (Ubuntu/Debian)

Minimal profile — nvim, tmux, lazygit + CLI utilities (no casks/GUI apps):

1. Run `./linux/bootstrap.sh`
2. Run `./install.linux`

See [linux/README.md](linux/README.md) for details.

## Dependencies

- fish
- [fisher](curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher)
- homebrew

## Cheatsheets

- [fzf.fish](https://github.com/PatrickF1/fzf.fish)

### Kitty
`kitty list-fonts` lists available fonts
`kitty +kitten themes` lists & sets themes

