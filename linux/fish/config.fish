# Linux fish config — minimal counterpart of ../../fish/config.fish
# Differences vs macOS: no homebrew paths, no pbcopy, no orbstack.

set -g fish_greeting ""
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME "$HOME/.config"

# after EDITOR is set: aliases.fish binds ctrl-e to "$EDITOR ."
source ~/.config/fish/aliases.fish

# optional, machine-local secrets (not in git)
test -f ~/.config/fish/private.fish; and source ~/.config/fish/private.fish

# PATH: user binaries (fd/bat shims, lazygit) + neovim tarball install
# NOTE: node comes from mise (see 'version mgrs' below); pi uses its bundled node.
fish_add_path -g "$HOME/.local/bin"
test -d /opt/nvim/bin; and fish_add_path -g /opt/nvim/bin

# ---------------------------------------------------------------- clipboard
# Pick whatever this box actually has: wayland -> wl-copy, x11 -> xclip
if type -q wl-copy
    set -gx CLIP_COPY "wl-copy"
    alias pbcopy "wl-copy"
    alias pbpaste "wl-paste"
else if type -q xclip
    set -gx CLIP_COPY "xclip -selection clipboard"
    alias pbcopy "xclip -selection clipboard"
    alias pbpaste "xclip -selection clipboard -o"
end

# ---------------------------------------------------------------------- FZF
set -gx FZF_DEFAULT_COMMAND "fd --hidden --no-ignore --follow --exclude='**/.git/'"
set -gx FZF_DEFAULT_OPTS '--height 50% --min-height=30 --layout=reverse
--bind=ctrl-u:preview-half-page-up
--bind=ctrl-d:preview-half-page-down'

set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND "--type=f"
set -gx FZF_CTRL_T_OPTS "--preview='bat --style=numbers --color=always {}'"
set -gx FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND "--type=d"
set -gx FZF_ALT_C_OPTS "--preview='tree -C {}'"
set -gx FZF_CTRL_R_OPTS "--preview='echo {}' --preview-window=down:3:hidden:wrap --bind='?:toggle-preview'"

# ------------------------------------------------------------ version mgrs
# only sourced when actually installed
if test -f /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish
    source /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish
else if test -f "$HOME/.asdf/asdf.fish"
    source "$HOME/.asdf/asdf.fish"
end

type -q mise; and mise activate fish | source

fish_default_key_bindings

# theme toggle for nvim only (no kitty on a server)
function dark-theme
    sed -i 's/vim.o.background.*/vim.o.background = "dark"/' ~/.config/nvim/lua/plugins/ui.lua
end

function light-theme
    sed -i 's/vim.o.background.*/vim.o.background = "light"/' ~/.config/nvim/lua/plugins/ui.lua
end
fish_add_path $HOME/.config/composer/vendor/bin
