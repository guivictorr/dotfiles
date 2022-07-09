call plug#begin('~/.config/nvim/plugged')
Plug 'getomni/neovim', { 'branch': 'main' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

colorscheme omni

lua << END
require('lualine').setup {
  options = {
    theme = 'omni'
  }
}
END

" -- Nvim Tree ------------------------------------
lua << END
local g = vim.g

g.nvim_tree_git_hl = git_status

require'nvim-tree'.setup {
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   open_on_tab = true,
   hijack_cursor = true,
   update_cwd = true,
   renderer = {
     root_folder_modifier = table.concat { ":t:gs?$?/", string.rep(" ", 1000), "?:gs?^??" },
     highlight_opened_files = "all",
     add_trailing = true,
     special_files = { },
     indent_markers = {
       enable = true
     },
     icons = {
       glyphs = {
           default = "",
           symlink = "",
           git = {
              deleted = "",
              ignored = "◌",
              renamed = "➜",
              staged = "✓",
              unmerged = "",
              unstaged = "",
              untracked = "",
           },
           folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
           },
        }
     }
   },
   filters = {
     custom = { ".git", "node_modules", ".cache", "*.bs.js" }
   },
   git = {
    ignore = true
   },
   update_focused_file = {
      enable = true,
      update_cwd = true,
   },
   view = {
      side = "left",
      width = 32,
   },
}
END


" Auto complete with control space and tab completions
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" IDK
command! -nargs=0 FormatFiles :CocCommand  prettier.formatFile eslint.executeAutofix
au VimEnter * NvimTreeFocus


" -- Typos ----------------------------------------
iabbrev lenght length
iabbrev widht width
iabbrev heigth height
iabbrev investiments investments
" --------------------------------------------------

" -- Keys ------------------------------------------
nnoremap <silent><c-f> <cmd>Telescope find_files<cr>
nnoremap <silent> <c-b> :NvimTreeToggle <cr>
nnoremap <silent> <c-e> :NvimTreeFocus <cr>
" ---------------------------------------------------
"
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
