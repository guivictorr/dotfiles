# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

# Set name of the theme to load --- if set to "random", it will be random
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias tasks=bpytop

# ANDROID_SDK
# export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
# export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# export JAVA_HOME=`/usr/libexec/java_home -v 11.0`

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/guilhermevictor/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/guilhermevictor/gcloud/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/guilhermevictor/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/guilhermevictor/gcloud/google-cloud-sdk/completion.zsh.inc'; fi

# Go Binaries
export PATH=$PATH:$(go env GOPATH)/bin
