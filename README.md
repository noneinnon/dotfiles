## Quick summary

- *[nvim](https://neovim.io)* - text editor / IDE
- *[kitty](https://sw.kovidgoyal.net/kitty/)* - terminal emulator

## Basic usage

### Updating Brewfile

There are handly alliases in`fish/aliases.fish`, that can be used to update Brewfile:
1. `brewup` - installs deps from `~/dotfiles/Brewfile`
2. `brewdump` - updates Brewfile in `/dotfiles/Brewfile`

## Installation

1. Ensure all dependencies are installed
2. Run `brewup`
3. Run `sh install`

## Dependencies

- fish
- [fisher](curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher)
- fzf
- homebrew
- neovim 6.0 or later

## Features

- handy aliases
- fzf integration

## Themes

- fish theme: [spacefish](https://spacefish.matchai.dev)

## Cheatsheets

- [fzf.fish](https://github.com/PatrickF1/fzf.fish)
