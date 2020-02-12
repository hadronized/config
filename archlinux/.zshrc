export LANG=en_US.UTF-8
export EDITOR='nvim'
export TERM=xterm-256color
export TERMINAL=termite

alias ls='~/github/exa-fork/target/release/exa --icons'
alias make='make -j16'

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
HISTSIZE=1000
SAVEHIST=1000
setopt inc_append_history
setopt share_history

# Plugins
source ~/.config/zsh/plugins.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:~/.cargo/bin:~/bin:~/.local/bin:/Users/dsabadie/Library/Python/2.7/bin/:/usr/local/opt/llvm/bin

# Custom bindings
# git checkout <branch>
bindkey -s '^gb' 'git branch | fzf --height 40% --reverse | cut -c 3- | xargs git switch^M'

# git push <remote>
bindkey -s '^gp' 'git remote | fzf --height 40% --reverse | xargs git push^M'

# git commit preview
bindkey -s '^gc' 'git log --oneline | fzf --reverse --preview "cut -f 1 -d \u27 \u27 <<< {} | xargs git show --color=always --pretty=format:%b"^M'

# git rebase <remote>
bindkey -s '^gr' 'git remote | fzf --height 20% --reverse | xargs git rebase^M'

eval "$(starship init zsh)"

# Platform dependent configuration
test -e ~/.zsh_profile && source ~/.zsh_profile
