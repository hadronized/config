HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export LD_LIBRARY_PATH=/usr/local/lib/
export PATH=$PATH:~/bin:/usr/local/bin:~/.cabal/bin
export EDITOR="nvim"
export TERM=xterm-256color

alias ls='ls -G --color'
alias glog='git log --abbrev-commit --graph --decorate --all'

autoload -U colors
colors

setopt promptsubst

function gitPrompt() {
  # git current branch
  currentBranch=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  if (($? == 0))
  then
    echo -n "%F{green}$currentBranch%f"
  fi

  # git stash
  stashNb=`git stash list 2> /dev/null | wc -l`
  if [ "$stashNb" != "0" ]
  then
    echo -n " %F{blue}($stashNb)%f"
  fi

  echo ''
}

PS1="%F{red}%n%F{cyan}@%F{magenta}%M %F{cyan}%~ %F{yellow}%% %f"
RPROMPT='$(gitPrompt)'

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
#zstyle :compinstall filename '/home/skp/.zsh/completion.zsh'

autoload -Uz compinit
compinit
