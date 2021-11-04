zmodload zsh/datetime

function preexec() {
  __TIMER=$EPOCHREALTIME
}

function powerline_precmd() {
  local __ERRCODE=$?
  local __DURATION=0

  if [ -n $__TIMER ]; then
    local __ERT=$EPOCHREALTIME
    __DURATION="$(($__ERT - ${__TIMER:-__ERT}))"
  fi

  eval "$($GOPATH/bin/powerline-go -error $__ERRCODE -duration $__DURATION -shell zsh -eval -modules-right duration,aws,docker,docker-context,kube -jobs ${${(%):%j}:-0})"

  unset __TIMER
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    install_powerline_precmd
fi


