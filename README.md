# dotfiles

Eternal WIP

I use this repository to store configuration files from my terminal, neovim, tmux and some other apps.

Some tools that I'm currently using are:

- neovim
- LazyVim
- tmux
- ghostty
- zsh

## Theme: Catppuccin Mocha

Neovim, tmux, fzf and Windows Terminal use [Catppuccin](https://catppuccin.com) Mocha.

- **Neovim**: `config/nvim/lua/plugins/colorscheme.lua`, installed by lazy.nvim on first start.
- **tmux**: `config/tmux/tmux.conf`. After stowing, press `prefix + I` to install the plugins with TPM (catppuccin included).
- **fzf**: colors in `FZF_DEFAULT_OPTS` in `root/.zshrc`.
- **Windows Terminal**: merge `windows-terminal/catppuccin-mocha.json` into `settings.json`
  (`schemes` and `themes` arrays, top-level `theme`, and `profiles.defaults.colorScheme`).
