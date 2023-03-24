alias oldvim vim
alias vim nvim
set -U EDITOR nvim
set -g fish_greeting ""

source ~/.config/fish/aliases.fish
source ~/.config/fish/private.fish
source ~/.config/fish/variables.fish

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# FZF
## https://gist.github.com/max-sixty/3ce6b262b650ac5b94f94c9c190ef7d4
export FZF_DEFAULT_COMMAND="rg --files --hidden"
export XDG_CONFIG_HOME="$HOME/.config"
set -gx FZF_DEFAULT_COMMAND "fd --hidden --no-ignore --follow --exclude='**/.git/'"
# https://github.com/junegunn/fzf/wiki/Examples#clipboard
# `--min-height` is useful with tiny terminal windows; e.g. for VSCode,
# especially when the preview window is important, like in git log.
# TODO: could we use
# https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_clipboard_copy.fish
# to allow this to work on multiple platforms?
set -gx FZF_DEFAULT_OPTS '--height 50% --min-height=30 --layout=reverse --color=light 
--bind="ctrl-y:execute-silent(printf {} | cut -f 2- | pbcopy)" 
--bind=ctrl-u:preview-half-page-up 
--bind=ctrl-d:preview-half-page-down
--bind="ctrl-o:execute-silent(code {-1})"'

set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND "--type=f"
set -gx FZF_CTRL_T_OPTS "--preview='bat --style=numbers --color=always {}'"
set -gx FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND "--type=d"
set -gx FZF_ALT_C_OPTS "--preview='exa -T {}'" 
# https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
set -gx FZF_CTRL_R_OPTS "--preview='echo {}' --preview-window=down:3:hidden:wrap --bind='?:toggle-preview'"

#https://github.com/PatrickF1/fzf.fish/pull/273
set -gx $EDITOR "nvim"
# Ctrl-o will open the selected file/directory in your editor of choice.
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

function fzf_add_to_commandline -d 'add stdin to the command line, for fzf functions'
    read -l -z result
    commandline -t ""
    # Do we need to escape this? This was here before, but doesn't work well with
    # multiline strings.
    # commandline -it -- (string escape $result)
    commandline -it -- (echo $result | paste -s -d" " -)
    commandline -f repaint
  end

function fzf-rg-search-widget -d 'find text in files'
	set rg_command "rg --ignore-case --files-with-matches -uu --iglob='!**/.git/' --follow"
# Start with all files; i.e. .*
	FZF_DEFAULT_COMMAND="$rg_command '.*'" SHELL=fish fzf \
	  -m \
	  -e \
	  --ansi \
	  --disabled \
	  --bind "change:reload:$rg_command {q} || true" \
	  # I'm not sure what this `cut` does — but remove it and the whole thing fails.
	  --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2 \
	  | fzf_add_to_commandline
end

## FZF keybindings
fzf_configure_bindings --directory=\cf --history=\cr --processes=\cp --variables=\cv


# Status line
function node_prompt_version
	if ls | grep package.json &> /dev/null
		if which node &> /dev/null
			echo "%{$fg_bold[blue]%}node:(%{$fg[red]%}$(node -v)%{$fg[blue]%})"
		end
	end
end
