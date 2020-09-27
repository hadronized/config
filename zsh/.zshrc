source ~/.zprofile
source ~/.fzfrc

# Completion
autoload -Uz compinit && compinit
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# History
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=999999999
setopt inc_append_history
setopt share_history

# Plugins
source ~/.config/zsh/plugins.sh

eval "$(starship init zsh)"
