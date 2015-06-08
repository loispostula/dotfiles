source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
TERM=konsole-256color
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
