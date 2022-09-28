# Ngrok

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi


# Kubernetes
source <(kubectl completion zsh)
