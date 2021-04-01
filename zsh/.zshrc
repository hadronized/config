source ~/.zprofile
source ~/.fzfrc

# Completion
autoload -Uz compinit && compinit
autoload -Uz vcs_info

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst
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
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats       '%B%u %c %B%F{magenta} %b'
zstyle ':vcs_info:git:*' actionformats '%B%u %c %B%F{magenta} %b'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' get-revision true
zstyle ':vcs_info:git:*' stagedstr '%F{green}✓'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}±'
#
# enable hooks, requires Zsh >=4.3.11
if [[ $ZSH_VERSION == 4.3.<11->* || $ZSH_VERSION == 4.<4->* || $ZSH_VERSION == <5->* ]] ; then
  # hook for untracked files
  +vi-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == 'true'  ]] && \
       [[ -n $(git ls-files --others --exclude-standard) ]] ; then
       hook_com[staged]+='%F{yellow}?'
    fi
  }

  # unpushed commits
  +vi-outgoing() {
    local gitdir="$(git rev-parse --git-dir 2>/dev/null)"
    [ -n "$gitdir" ] || return 0

    if [ -r "${gitdir}/refs/remotes/git-svn" ] ; then
      local count=$(git rev-list remotes/git-svn.. 2>/dev/null | wc -l)
    else
      local branch="$(cat ${gitdir}/HEAD 2>/dev/null)"
      branch=${branch##*/heads/}
      local count=$(git rev-list remotes/origin/${branch}.. 2>/dev/null | wc -l)
    fi

    if [[ "$count" -gt 0 ]] ; then
      hook_com[staged]+="%F{green}↑$count"
    fi
  }

  # hook for stashed files
  +vi-stashed() {
    if git rev-parse --verify refs/stash &>/dev/null ; then
      hook_com[staged]+='%F{red}$'
    fi
  }

  zstyle ':vcs_info:git*+set-message:*' hooks stashed untracked outgoing
fi

# History
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=999999999
setopt inc_append_history
setopt share_history

# Shell functions.
. ~/config/bin/shell-functions

# Prompt.
PS1='%B%F{green} %~ %F{magenta}λ %f%b'
RPS1='$vcs_info_msg_0_ '

if [ -e /Users/dimitri.sabadie/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/dimitri.sabadie/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Kubenertes
kube_ps1="/usr/local/opt/kube-ps1/share/kube-ps1.sh"
if [ -e $kube_ps1 ]; then
  source $kube_ps1
  KUBE_PS1_PREFIX=
  KUBE_PS1_SUFFIX=
  KUBE_PS1_SEPARATOR=
  RPS1=$RPS1'$(kube_ps1) '
fi

