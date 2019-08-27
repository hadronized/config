# vim:ft=zsh ts=2 sw=2 sts=2

RETVAL=$?

function mark() {
  echo -n '%B%F{magenta}\u2192'
}

function git_info_plus() {
  stashNb=$(git stash list 2> /dev/null | wc -l | tr -d ' ')
  if [ "$stashNb" != "0" ]; then
    echo -n " %F{red}"
    for i in $(seq 1 $stashNb); do
      echo -n "·"
    done
    echo -n '%f'
  fi

  git status &> /dev/null
  if [ "$?" = "0" ]; then
    echo -n " $(mark)"
  else
    echo -n "$(mark)"
  fi
}

function show_path() {
  cwd=$1

  # change cwd to only show the current relative path to the git root
  git_root=$(git rev-parse --show-toplevel 2> /dev/null)
  if [ "$?" = "0" ]; then
    git_root=${git_root%/*}
    cwd="%F{red}…%F{green}/${${PWD#$git_root}#/}"
  fi

  echo "%F{green}$cwd"
}

function reverse_prompt() {
  # check if we are in a Rust project
  cargo_project_version=$(cargo pkgid 2> /dev/null)
  if [ "$?" = "0" ]; then
    rprompt="📦 %F{green}${cargo_project_version#*#}"

    # add rustc version
    rustc_version=$(rustc --version | cut -d' ' -f2)
    rprompt="🦀 %F{red}$rustc_version $rprompt"
  else
    # node
    node_project_version=$(npm view . version 2> /dev/null)
    if [ "$?" = "0" ]; then
      npm_version=$(npm --version)
      nvm_version=$(nvm current)
      echo "%F{yellow} $nvm_version %F{red} $npm_version %F{green}⬢ $node_project_version"
    fi
  fi

  echo $rprompt
}

PROMPT='%B$(show_path %~) $(git_prompt_info)$(git_info_plus)%f%b '
RPROMPT='$(reverse_prompt)'

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX="%F{blue}\ue0a0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}\u00b1"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{cyan}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

export LS_COLORS=$LS_COLORS:'ln=1;92:di=1;31'
