# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.oh-my-zsh

# Set name of the theme to load.
# Look in $HOME/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="phaazon"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

[ -e $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.cabal/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export LANG=en_US.UTF-8
export EDITOR='nvim'
export TERM=xterm-256color
export TERMINAL='termite'

alias ls='$HOME/github/exa-fork/target/release/exa --icons'

# Custom colors for unifying theming
source ~/.Xcolors

[ -e $HOME/.fzfrc ] && source $HOME/.fzfrc

# Custom bindings
# git checkout <branch>
bindkey -s '^gb' '^Ugit branch | fzf --height 20% --reverse | cut -c 3- | xargs git checkout^M'

# git push <remote>
bindkey -s '^gp' '^Ugit remote | fzf --height 20% --reverse | xargs git push^M'
