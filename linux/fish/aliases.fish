# Linux aliases — minimal counterpart of ../../fish/aliases.fish
# Dropped: brew*, subl, neovide, open -a, sail/artisan, bw (bitwarden).

# ---------------------------------------------------------------- basics
alias vim 'nvim'
alias la 'ls -A'
alias ll 'ls -alh'
alias img 'curl -O'
alias c 'clear'
alias o 'xdg-open'

type -q batcat; and alias bat 'batcat'
type -q fdfind; and alias fd 'fdfind'

# ---------------------------------------------------------------- editors
alias n 'nvim'
alias vf 'fzf | xargs nvim'

# ------------------------------------------------------------------- git
alias lg 'lazygit'
alias gco 'git branch --sort=-committerdate | fzf --header "Checkout recent branch" --preview "git diff {1} --color=always | delta" | xargs git checkout'

function ghpr
    GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
end

function ghw
    gh repo view --web
end

function ghp
    gh pr view --web
end

function ghpc
    gh pr create --fill
end

# ------------------------------------------------------------------ tmux
alias ta 'tmux attach'
alias tl 'tmux ls'

# --------------------------------------------------------- containers/k8s
alias dc 'docker compose'
alias compose 'docker compose'
alias k 'kubectl'
alias t 'terraform'

# ------------------------------------------------------------------- node
alias p 'pnpm'

function sscripts
    bat package.json | jq ".scripts" | fzf --ansi --header "NPM scripts for $(pwd) | CTRL-C to cancel" | cut -d ":" -f 1 | xargs -I {} npm run {}
end

# ------------------------------------------------------------------- misc
alias fp 'fish --private'

function posix-source
    for i in (cat $argv)
        set arr (echo $i | string match -r "([^=]+)=(.*)")
        set -gx $arr[2] $arr[3]
    end
end

# open a remote dir in nvim via oil.nvim
function no
    nvim "oil-ssh://$argv"
end

# Bindings
bind \ce "$EDITOR ."
