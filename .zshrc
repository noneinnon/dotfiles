export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/antbaranov/.oh-my-zsh"

# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-syntax-highlighting
	git
  tmux
)


source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Load dotfiles:
for file in ~/.{bash_prompt,aliases,private,bash_profile}; do
		echo $file
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --hidden"

# Python
#if command -v pyenv 1>/dev/null 2>&1; then
  #eval "$(pyenv init -)"
#fi

export PYTHON_CONFIGURE_OPTS="--enable-framework"

# Etc
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# Color theme
ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# Tmux
ZSH_TMUX_AUTOSTART=true

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Status line
function node_prompt_version {
	if ls | grep package.json &> /dev/null; then
		if which node &> /dev/null; then
			echo "%{$fg_bold[blue]%}node:(%{$fg[red]%}$(node -v)%{$fg[blue]%})"
		fi
	fi
}

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(node_prompt_version) $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

export PATH="/usr/local/opt/python@3.9/bin:$PATH"
