alias oldvim vim
alias vim nvim
set -U EDITOR nvim

source ~/.config/fish/aliases.fish
source ~/.config/fish/private.fish
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
