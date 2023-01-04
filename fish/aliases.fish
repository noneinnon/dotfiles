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
alias gco='git branch --sort=-committerdate | fzf --header "Checkout recent branch" --preview "git diff {1} --color=always | delta" | xargs git checkout'
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

# https://github.com/PatrickF1/fzf.fish
function _fzf_wrapper --description "Prepares some environment variables before executing fzf."
    # Make sure fzf uses fish to execute preview commands, some of which
    # are autoloaded fish functions so don't exist in other shells.
    # Use --local so that it doesn't clobber SHELL outside of this function.
    set --local --export SHELL (command --search fish)

    # If FZF_DEFAULT_OPTS is not set, then set some sane defaults.
    # See https://github.com/junegunn/fzf#environment-variables
    if not set --query FZF_DEFAULT_OPTS
        # cycle allows jumping between the first and last results, making scrolling faster
        # layout=reverse lists results top to bottom, mimicking the familiar layouts of git log, history, and env
        # border shows where the fzf window begins and ends
        # height=90% leaves space to see the current command and some scrollback, maintaining context of work
        # preview-window=wrap wraps long lines in the preview window, making reading easier
        # marker=* makes the multi-select marker more distinguishable from the pointer (since both default to >)
        set --export FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'
    end

    fzf $argv
end

function _fzf_search_history --description "Search command history. Replace the command line with the selected command."
    # history merge incorporates history changes from other fish sessions
    # it errors out if called in private mode
    if test -z "$fish_private_mode"
        builtin history merge
    end

    # Delinate commands throughout pipeline using null rather than newlines because commands can be multi-line
    set commands_selected (
        # Reference https://devhints.io/strftime to understand strftime format symbols
        builtin history --null --show-time="%m-%d %H:%M:%S │ " |
        _fzf_wrapper --read0 \
            --print0 \
            --multi \
            --tiebreak=index \
            --prompt="Search History> " \
            --query=(commandline) \
            --preview="echo -- {4..} | fish_indent --ansi" \
            --preview-window="bottom:3:wrap" \
            $fzf_history_opts |
        string split0 |
        # remove timestamps from commands selected
        string replace --regex '^\d\d-\d\d \d\d:\d\d:\d\d │ ' ''
    )

    if test $status -eq 0
        commandline --replace -- $commands_selected
    end

    commandline --function repaint
end

    # Always installs bindings for insert and default mode for simplicity and b/c it has almost no side-effect
# https://gitter.im/fish-shell/fish-shell?at=60a55915ee77a74d685fa6b1
function fzf_configure_bindings --description "Installs the default key bindings for fzf.fish with user overrides passed as options."
    # no need to install bindings if not in interactive mode or running tests
    status is-interactive || test "$CI" = true; or return

    set options_spec h/help 'directory=?' 'git_log=?' 'git_status=?' 'history=?' 'processes=?' 'variables=?'
    argparse --max-args=0 --ignore-unknown $options_spec -- $argv 2>/dev/null
    if test $status -ne 0
        echo "Invalid option or a positional argument was provided." >&2
        _fzf_configure_bindings_help
        return 22
    else if set --query _flag_help
        _fzf_configure_bindings_help
        return
    else
        # Initialize with default key sequences and then override or disable them based on flags
        # index 1 = directory, 2 = git_log, 3 = git_status, 4 = history, 5 = processes, 6 = variables
        set key_sequences \e\cf \e\cl \e\cs \cr \e\cp \cv # \c = control, \e = escape
        set --query _flag_directory && set key_sequences[1] "$_flag_directory"
        set --query _flag_git_log && set key_sequences[2] "$_flag_git_log"
        set --query _flag_git_status && set key_sequences[3] "$_flag_git_status"
        set --query _flag_history && set key_sequences[4] "$_flag_history"
        set --query _flag_processes && set key_sequences[5] "$_flag_processes"
        set --query _flag_variables && set key_sequences[6] "$_flag_variables"

        # If fzf bindings already exists, uninstall it first for a clean slate
        if functions --query _fzf_uninstall_bindings
            _fzf_uninstall_bindings
        end

        for mode in default insert
            test -n $key_sequences[1] && bind --mode $mode $key_sequences[1] _fzf_search_directory
            test -n $key_sequences[2] && bind --mode $mode $key_sequences[2] _fzf_search_git_log
            test -n $key_sequences[3] && bind --mode $mode $key_sequences[3] _fzf_search_git_status
            test -n $key_sequences[4] && bind --mode $mode $key_sequences[4] _fzf_search_history
            test -n $key_sequences[5] && bind --mode $mode $key_sequences[5] _fzf_search_processes
            test -n $key_sequences[6] && bind --mode $mode $key_sequences[6] "$_fzf_search_vars_command"
        end

        function _fzf_uninstall_bindings --inherit-variable key_sequences
            bind --erase -- $key_sequences
            bind --erase --mode insert -- $key_sequences
        end
    end
end

alias h=_fzf_search_history
