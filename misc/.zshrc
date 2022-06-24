# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
    evalcache
    battery
    # zsh-z
	# zsh-syntax-highlighting
	# zsh-vim-mode
)

source $ZSH/oh-my-zsh.sh

# bindkey '^I'   complete-word       # tab          | complete
# bindkey '^[[1;    ' autosuggest-accept  # shift + tab  | autosuggest
# bindkey '`' autosuggest-accept
bindkey '^ ' autosuggest-accept # Using Ctrl+Space instead of right arrow key for accepting auto-complete suggestion

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
   # Original: export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize promp, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# export JAVA_HOME="/usr/lib/jvm/jdk-16.0.1"
# export PATH_TO_FX="/media/data/Misc/E/softwares/javafx-sdk-11.0.2/lib"
export PATH="$PATH:/home/fenil/anaconda3/bin"
export PATH="$PATH:$DART_SDK/bin"
export PATH="$PATH:/Users/feniljain/Projects/softwares/flutter/bin/"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOBIN"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="$PATH:/home/fenil/evans_linux_386"
# export PATH="$PATH:/home/fenil/nvim-linux64/bin"
export PATH="$PATH:/opt/firefox/firefox"
export PATH="$PATH:/usr/local/share/npm/bin"
# export PATH="$PATH:/home/fenil/flutter_linux_v1.9.1+hotfix.6-stable/flutter/bin/cache/dart-sdk/bin"
# export PATH="$PATH:$HOME/.pub-cache/bin"
# export PATH="$PATH:/opt/yarn-1.22.5/bin"
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!" # Open man pages in nvim with syntax highlighting
export RUST_BACKTRACE=1
export PATH="$PATH:/Users/feniljain/.pyenv/shims/"

# ==== Mac setup
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/Users/feniljain/Library/Python/3.8/bin
export LLVM_DIR=/usr/local/opt/llvm@13
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-17.0.2.jdk/Contents/Home"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export TERM=xterm-256color
export PATH=/opt/homebrew/bin:$PATH
# export PATH=/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.0.0/bin:$PATH
# export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LC_ALL=en_US.UTF-8
# ==============

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/fenil/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/fenil/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/fenil/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/fenil/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

alias luamake=/home/feniljain/Projects/softwares/lua-language-server/3rd/luamake/luamake
alias goland=/opt/GoLand-2021.1.3/bin/goland.sh
alias trishul='docker run -it --mount type=bind,src="$(pwd)",target=/app/protos registry.appointy.com/trishul'
# alias trishul='docker run -it --mount type=bind,src="$(pwd)",target=/app/protos ayushbpl10/trishul:v1'
alias cls='printf "\ec"'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/llvm/bin:$PATH"

vgrep() {
  INITIAL_QUERY="$1"
  VGREP_PREFIX="vgrep --no-header "
  FZF_DEFAULT_COMMAND="$VGREP_PREFIX '$INITIAL_QUERY'" \
  fzf --bind "change:reload:$VGREP_PREFIX {q} || true" --ansi --phony --tac --query "$INITIAL_QUERY" \
  | awk '{print $1}' | xargs -I{} -o vgrep --show {}
}

# asdf stuff
. /usr/local/opt/asdf/libexec/asdf.sh
