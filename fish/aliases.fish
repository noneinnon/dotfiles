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

alias s="sh ~/dotfiles/scripts/session.sh"

# npm
function sscripts
    bat package.json | jq ".scripts" | fzf --ansi --header "NPM scripts for $(pwd) | CTRL-C to cancel" | cut -d ":" -f 1 | xargs -I {} npm run {}
end
alias svers='cat package.json | jq ".version"'


# GIT
alias gco='git branch --sort=-committerdate | fzf --header "Checkout recent branch" --preview "git diff {1} --color=always | delta" | xargs git checkout'
function ghpr 
    GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
end

# Paths
alias vimrc='vim ~/.vimrc'
alias nvimrc='vim ~/.config/nvim/init.vim'
alias zshrc='vim ~/.zshrc'

# FZF
alias vf='vim $(fzf)'
#alias gcb='fzf-git-branch'
function replace
	set rg_command "rg --ignore-case --files-with-matches -uu --iglob='!**/.git/' --follow"
# Start with all files; i.e. .*
	set files $(FZF_DEFAULT_COMMAND="$rg_command '.*'" SHELL=fish fzf \
	  -m \
	  -e \
	  --ansi \
	  --disabled \
	  --bind "change:reload:$rg_command {q} || true" \
	  # I'm not sure what this `cut` does — but remove it and the whole thing fails.
	  --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2)
	# files | fzf --bind "change:reload:$rg_command {q} || true" \
	# 	    --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2)
	echo $files
end

# Other
alias lg='lazygit'
alias ghw='gh repo view --web'
alias theme="kitty +kitten themes"
#alias neo='open -na "neovide" --args --frame None'

# Brew
alias brewup='brew update && brew upgrade && brew cleanup && brew doctor'
alias brewdump='brew bundle dump --force --file=~/dotfiles/Brewfile'
