# zmodload zsh/zprof # used for profiling the shell to increase startup times

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
DISABLE_AUTO_UPDATE="true" # This is a heavy function and I will update if I want to :)

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

# ==== History related settings

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Expire duplicate entries first when trimming history:
setopt HIST_EXPIRE_DUPS_FIRST

# Dont record an entry that was just recorded again:
setopt HIST_IGNORE_DUPS

# Delete old recorded entry if new entry is a duplicate:
setopt HIST_IGNORE_ALL_DUPS

# Do not display(in history file) a line previously found:
setopt HIST_FIND_NO_DUPS

# Dont write duplicate entries in the history file:
setopt HIST_SAVE_NO_DUPS

# Share history between all sessions:
setopt SHARE_HISTORY

# Execute commands using history (e.g.: using !$) immediatel: # This is for slightly better speeds
unsetopt HIST_VERIFY

# =====================

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-autosuggestions
        evalcache
        # git
        # zsh-z
	# zsh-syntax-highlighting
	# zsh-vim-mode
)

source $ZSH/oh-my-zsh.sh

# bindkey '^I'   complete-word       # tab          | complete
# bindkey '^[[1;    ' autosuggest-accept  # shift + tab  | autosuggest
# bindkey '`' autosuggest-accept
bindkey '^ ' autosuggest-accept # Using Ctrl+Space instead of right arrow key for accepting auto-complete suggestion
bindkey -v '^ ' autosuggest-accept # Same but for vim mode

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

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

export TERM=xterm-256color
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!" # Open man pages in nvim with syntax highlighting
export RUST_BACKTRACE=1

export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.local/bin"
# export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$HOME/.cargo/bin:$PATH"

export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_TYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Next two lines are from preventing
# zsh giving repetitive "correct `cargo`
# to `.cargo` prompts"
#
# source:
# https://superuser.com/questions/439209/how-to-partially-disable-the-zshs-autocorrect
unsetopt correct_all
setopt correct

set -o emacs

# ==============

# Mac setup

export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/sbin:$PATH"

if [ -e /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]; then
    source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi

export PATH=$PATH:/Users/feniljain/.local/share/bob/nvim-bin

# ==============

# ==============

# NVM Settings

##### nvm (node version manager) #####
# placeholder nvm shell function
# On first use, it will set nvm up properly which will replace the `nvm`
# shell function with the real one
function nvm() {
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    if [[ -e ~/.nvm/alias/default ]]; then
      PATH="${PATH}:${HOME}.nvm/versions/node/$(cat ~/.nvm/alias/default)/bin"
    fi
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    # invoke the real nvm function now
    nvm "$@"
}

# ==============

# e6data specific configs
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.2.jdk/Contents/Home"
export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
# export PATH=$PATH:/opt/homebrew/opt/

# ==============

# Aliases
alias reset="reset && printf '\33c\e[3J'" # https://askubuntu.com/questions/25077/how-to-really-clear-the-terminal

# ==============

# Word based operations
# https://github.com/ohmyzsh/ohmyzsh/blob/69a6359f7cf8978d464573fb7b023ee3cd00181a/lib/key-bindings.zsh#L99-L111

# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey -M vicmd '^[[3;5~' kill-word

# bindkey -M emacs '^[[1;5D' backward-word                  # ctrl+left
# bindkey -M emacs '^[[1;5C' forward-word                   # ctrl+right

# # [Ctrl-RightArrow] - move forward one word
# bindkey -M emacs '^[[1;5C' forward-word
# bindkey -M viins '^[[1;5C' forward-word
# bindkey -M vicmd '^[[1;5C' forward-word
# # [Ctrl-LeftArrow] - move backward one word
# bindkey -M emacs '^[[1;5D' backward-word
# bindkey -M viins '^[[1;5D' backward-word
# bindkey -M vicmd '^[[1;5D' backward-word

# ==============
export PATH="/opt/homebrew/opt/python@3.11/bin:$PATH"

