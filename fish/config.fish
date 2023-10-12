source ~/.config/fish/aliases.fish
source ~/.config/fish/private.fish

set -g fish_greeting ""

# FZF
## https://gist.github.com/max-sixty/3ce6b262b650ac5b94f94c9c190ef7d4
export FZF_DEFAULT_COMMAND="rg --files --hidden"
export XDG_CONFIG_HOME="$HOME/.config"
set -gx FZF_DEFAULT_COMMAND "fd --hidden --no-ignore --follow --exclude='**/.git/'"
# https://github.com/fish-shell/fish-shell/blob/master/share/functions/# to allow this to work on multiple platforms?
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


source /opt/homebrew/opt/asdf/libexec/asdf.fish
