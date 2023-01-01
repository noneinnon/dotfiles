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

# npm
alias sscripts='cat package.json | jq ".scripts"'
alias svers='cat package.json | jq ".version"'

# GIT
alias gco='git branch --sort=-committerdate | fzf --header "Checkout recent branch" --preview "git diff {1} --color=always" | xargs git checkout'
alias gb='git branch --sort=-committerdate'
alias gba='git branch --sort=committerdate'
alias gdf='git diff-tree --no-commit-id --name-only -r'
alias grf='git checkout HEAD --'

function ghpr 
    GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
end

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

# Brew
alias brewup='brew update && brew upgrade && brew cleanup && brew doctor'
alias brewdump='brew bundle dump --force --file=~/dotfiles/Brewfile'
