#
# ALIASES
alias la='ls -A'
alias rmr='rm -r'
alias img='curl -O'
alias ywav='youtube-dl -x --audio-format "wav"'
alias ymp3='youtube-dl -x --audio-format "wav"'
alias ymp4='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'

alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

alias sublime='open -a "Sublime text" .'
alias smerge='open -a "Sublime merge" .'

# npm
alias sscripts='cat package.json | jq ".scripts"'
alias svers='cat package.json | jq ".version"'

# GIT
alias gb='git branch --sort=-committerdate'
alias gba='git branch --sort=committerdate'
alias gdf='git diff-tree --no-commit-id --name-only -r'
alias grf='git checkout HEAD --'

# Paths
alias vimrc='vim ~/.vimrc'
alias nvimrc='vim ~/.config/nvim/init.vim'
alias zshrc='vim ~/.zshrc'

# FZF
alias vf='vim $(fzf)'
alias gco='fzf-git-checkout'
#alias gcb='fzf-git-branch'

# Kitty
alias s='kitty +kitten ssh'

# Other
alias lg='lazygit'
alias ghw='gh repo view --web'
#alias neo='open -na "neovide" --args --frame None'

