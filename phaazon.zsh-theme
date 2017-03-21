# vim:ft=zsh ts=2 sw=2 sts=2

RETVAL=$?

function mark() {
  echo -n '%B%F{cyan}\u2192'
}

function git_info_plus() {
  stashNb=`git stash list 2> /dev/null | wc -l`
  if [ "$stashNb" != "0" ]
  then
    echo -n " %F{blue}"
    for i in $(seq 1 $stashNb); do
      echo -n "·"
    done
    echo -n '%f'
  fi

  tag=`git describe HEAD --tags --abbrev=0 2> /dev/null`
  if [ "$tag" != "" ]
  then
    echo -n " %F{blue}[$tag]"
  fi

  git status &> /dev/null
  if [ "$?" = "0" ]
  then
    echo -n " $(mark)"
  else
    echo -n "$(mark)"
  fi
}

PROMPT='%B%F{green}%n %F{red}%~ $(git_prompt_info)$(git_info_plus)%f%b '
RPROMPT='%B%F{blue}%*%f %F{black}%M'


# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{magenta}\ue0a0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}\u00b1"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{green}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

export LS_COLORS=$LS_COLORS:'ln=1;92:di=1;31' 
