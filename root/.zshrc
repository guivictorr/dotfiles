# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME="spaceship"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

alias vim="nvim"
alias sd="cd ~ && cd \$(find -L SecondBrain personal work dotfiles -maxdepth 1 -mindepth 0 -type d ! -name '.*' 2>/dev/null | fzf)"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:-1,fg+:-1,bg:-1,bg+:-1
  --color=hl:-1,hl+:-1,info:-1,marker:-1
  --color=prompt:-1,spinner:-1,pointer:-1,header:-1
  --color=border:-1,label:-1,query:-1
  --marker="" --pointer="" --prompt=""'

export GPG_TTY=$(tty)

source $ZSH/oh-my-zsh.sh
