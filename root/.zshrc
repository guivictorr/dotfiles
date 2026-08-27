# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
source $ZSH/oh-my-zsh.sh

ZSH_THEME="spaceship"

plugins=(git zsh-syntax-highlighting)

alias sd="cd ~ && cd \$(find -L www -maxdepth 1 -mindepth 0 -type d ! -name '.*' 2>/dev/null | fzf)"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ask="claude -p $1"

export BAT_THEME=gruvbox-dark
export EDITOR=nvim
export GPG_TTY=$(tty)

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
