autoload colors && colors

directory_name() {
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

ret_status() {
  echo "%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
}

git_radar() {
  USE_DEV_RADAR="${USE_DEV_RADAR:-"true"}"
  if [[ $USE_DEV_RADAR == "true" ]]; then
    ~/Projects/personal/git-radar/git-radar --zsh --fetch
  else
    git-radar --zsh --fetch
  fi
}

powerline_branch="$(printf '\ue0a0')"
export GIT_RADAR_MASTER_SYMBOL="%{$fg_bold[blue]%}$powerline_branch%{$reset_color%}"
export GIT_RADAR_COLOR_BRANCH="$fg[white]"
export GIT_RADAR_FORMAT="%{ :remote}%{ :branch}%{ :local}%{ :stash}%{ :changes}"

export PROMPT=$'$(ret_status)$(directory_name)$(git_radar) '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "${PWD##*/}"
  set_prompt
}

preexec() {
  title "zsh" "%m" "${PWD##*/} - $2"
}
