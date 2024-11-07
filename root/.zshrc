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

export FZF_DEFAULT_OPTS='--height 60% --tmux center,40%,60% --layout reverse --no-scrollbar --color=pointer:#C18F40,prompt:#C18F40'
alias sd="cd ~ && cd \$(find personal work dotfiles ~/SecondBrain -maxdepth 1 -mindepth 1 -type d 2>/dev/null | fzf)"

# Set up fzf key bindings and fuzzy completion
# NVM Configuration
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export GPG_TTY=$(tty)
# Go Binaries
export PATH=$PATH:$(go env GOPATH)/bin

source $ZSH/oh-my-zsh.sh

alias vim="nvim"

# bun completions
[ -s "/Users/guilhermevictor/.bun/_bun" ] && source "/Users/guilhermevictor/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
