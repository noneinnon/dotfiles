# ALIASES
alias oldvim='vim'
alias vim='nvim'
alias la='ls -A'
alias img='curl -O'
alias ywav='youtube-dl -x --audio-format "wav"'
alias ymp3='youtube-dl -x --audio-format "wav"'
alias ymp4='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'

# npm
function sscripts
    bat package.json | jq ".scripts" | fzf --ansi --header "NPM scripts for $(pwd) | CTRL-C to cancel" | cut -d ":" -f 1 | xargs -I {} npm run {}
end

# GIT
alias gco='git branch --sort=-committerdate | fzf --header "Checkout recent branch" --preview "git diff {1} --color=always | delta" | xargs git checkout'
function ghpr 
    GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
end

# Brew
alias brewup='brew update && brew upgrade && brew cleanup && brew doctor'
alias brewdump='brew bundle dump --force --file=~/dotfiles/Brewfile'

# Other
alias n='neovide'
alias s='subl'
alias code='codium'

alias ta='tmux attach'

alias dc='docker compose'

alias vf='fzf | xargs nvim'

alias p='pnpm'
