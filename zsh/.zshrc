export CLICOLOR=TRUE
export COLORTERM=TRUE
# Configure less
export LESS='-g -i -M -R -S -w -z-4'
# Enable 256 colors for vim
# [[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

# Enable HOME and END keys
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

## Default programs ##
export EDITOR=vim
export PAGER=less
export BROWSER=firefox


## Aliases ##
alias ls='ls --color=auto'
alias ll='ls -hlF'
alias la='ls -a'
alias le='ls --group-directories-first --sort=extension'
alias lla='ll -a'
alias lle='le -hlF'
alias lae='le -a'

alias grep='grep --color=auto'

# Required so aliases work for sudo
alias sudo='sudo '

# Interactive mode: promt before overwrites
alias cp='cp -i'
alias mv='mv -i'
# Make rm safer
alias rm='rm -I --preserve-root'

alias pac-upgrade='pacman -Syu'
alias pac-autorm='pacman -Rns $(pacman -Qtdq)'


## History ##
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history

# Append to history file immediately after a command has been entered
setopt inc_append_history
# Load history file every time when "history" is called
setopt share_history
# Don't add commands with leading spaces to history
setopt hist_ignore_space
# When trimming the history, remove the oldest duplicates first
setopt hist_expire_dups_first
# Don't record duplicate entries
setopt hist_ignore_dups


## Misc ##
# Disable beeps on errors
setopt nobeep

# Don't display prompt when using *, because we already use rm -I
setopt rmstarsilent


## Load some modules ##
autoload -Uz colors compinit promptinit


## Custom prompt theme ##
fpath+=$HOME/.zfunctions
promptinit
prompt lean


## Autocorrection ##
compinit
# Required for 'menuselect' keymap
zmodload zsh/complist

# Visually select the currently selected item
zstyle ':completion:*' menu select

# Colors for list items
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32'
export LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# COLOR1=02
# COLOR2=01
# zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==${COLOR1}=${COLOR2}}:${(s.:.)LS_COLORS}")'

# Directories will be listed first
zstyle ':completion:*' list-dirs-first true
# Group matches into groups
zstyle ':completion:*:matches' group yes
zstyle ':completion:*' group-name ''
# Shift+Tab will go backwards in the list
bindkey -M menuselect '^[[Z' reverse-menu-complete
# Allow completion from within words
setopt complete_in_word


## Syntax highlighting and history substring search ##
source $HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# History substring search keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
