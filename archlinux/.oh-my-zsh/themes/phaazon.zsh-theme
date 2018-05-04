# vim:ft=zsh ts=2 sw=2 sts=2

RETVAL=$?

function mark() {
  echo -n '%B%F{magenta}\u2192'
  #echo -n '%B%F{magenta}>'
}

function git_info_plus() {
  stashNb=`git stash list 2> /dev/null | wc -l | tr -d ' '`
  if [ "$stashNb" != "0" ]
  then
    echo -n " %F{blue}"
    for i in $(seq 1 $stashNb); do
      echo -n "·"
    done
    echo -n '%f'
  fi

  git status &> /dev/null
  if [ "$?" = "0" ]
  then
    echo -n " $(mark)"
  else
    echo -n "$(mark)"
  fi
}

PROMPT=' %B%F{cyan}%~ $(git_prompt_info)$(git_info_plus)%f%b '

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX="%F{blue}\ue0a0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}\u00b1"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{cyan}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

export LS_COLORS=$LS_COLORS:'ln=1;92:di=1;31' 
