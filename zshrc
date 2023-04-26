# Functions
source ~/.shell/functions.sh

# Allow local customizations in the ~/.shell_local_before file
if [ -f ~/.shell_local_before ]; then
    source ~/.shell_local_before
fi

# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# XDG 
#source ~/.shell/xdg.sh
# Settings
source ~/.zsh/settings.zsh

# Key bindings
source ~/.zsh/key-bindings.zsh

# External settings
source ~/.shell/external.sh

# Aliases
source ~/.shell/aliases.sh

# Path
source ~/.shell/path.sh

# Golang
source ~/.shell/golang.sh


# Custom prompt
source ~/.zsh/prompt.zsh

# Auto Completions
source ~/.shell/autocompletions.sh


# Allow local customizations in the ~/.shell_local_after file
if [ -f ~/.shell_local_after ]; then
    source ~/.shell_local_after
fi

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi

# Allow private customizations (not checked in to version control)
if [ -f ~/.shell_private ]; then
    source ~/.shell_private
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/lpostula/Projects/postula/infrastructure/hashistack/google-cloud-sdk/path.zsh.inc' ]; then . '/home/lpostula/Projects/postula/infrastructure/hashistack/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/lpostula/Projects/postula/infrastructure/hashistack/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/lpostula/Projects/postula/infrastructure/hashistack/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
