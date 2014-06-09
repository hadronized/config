# Lines configured by Skypers
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

alias ls='ls -G --color'

autoload -U colors
colors

ic="%{$reset_color%}" # Input color
uc="%{$fg[green]%}" # User name color
sc="%{$fg[red]%}" # Symbol color
hc="%{$terminfo[sgr0]$fg[cyan]%}" # Hostname color
pc="%{$terminfo[sgr0]$fg[magenta]%}" # Path color

PROMPT="${uc}%n${sc}@${hc}%M ${pc}%~ ${sc}%% ${ic}"
export LD_LIBRARY_PATH=/usr/local/lib/
export PATH=$PATH:~/bin:/usr/local/bin:~/dmd2/osx/bin:~/.cabal/bin
export EDITOR="vim"

alias i3lock='i3lock -c 000000'
alias rmpd='mpd ~/.mpd.conf'

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

unsetopt beep
unsetopt extendedglob
unsetopt nomatch

export TERM=xterm-256color
