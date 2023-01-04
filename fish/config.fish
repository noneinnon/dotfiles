alias oldvim vim
alias vim nvim
set -U EDITOR nvim

source ~/.config/fish/aliases.fish
source ~/.config/fish/private.fish

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

export FZF_DEFAULT_COMMAND="rg --files --hidden"
export XDG_CONFIG_HOME="$HOME/.config"

# function fzf-git-branch 
#     command git rev-parse HEAD > /dev/null 2>&1 || return
#
#     command git branch --color=always --all --sort=-committerdate |
#         grep -v HEAD |
#         fzf --height 50% --ansi --no-multi --preview-window right:65% \
#             --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
#         sed "s/.* //"
# end

# Status line
function node_prompt_version
	if ls | grep package.json &> /dev/null
		if which node &> /dev/null
			echo "%{$fg_bold[blue]%}node:(%{$fg[red]%}$(node -v)%{$fg[blue]%})"
		end
	end
end
