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
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'chrisbra/Colorizer'
"Plug 'windwp/nvim-autopairs'
"Plug 'windwp/nvim-ts-autotag'
call plug#end()
set t_Co=256
set termguicolors
set background=dark

" Captuccin 
lua << EOF
local catppuccin = require("catppuccin")

catppuccin.setup {
transparent_background = false,
term_colors = false,
styles = {
	comments = "italic",
	conditionals = "italic",
	loops = "NONE",
	functions = "NONE",
	keywords = "NONE",
	strings = "NONE",
	variables = "NONE",
	numbers = "NONE",
	booleans = "NONE",
	properties = "NONE",
	types = "NONE",
	operators = "NONE",
},
integrations = {
	treesitter = true,
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = "italic",
			hints = "italic",
			warnings = "italic",
			information = "italic",
		},
		underlines = {
			errors = "underline",
			hints = "underline",
			warnings = "underline",
			information = "underline",
		},
	},
    coc_nvim = false,
	lsp_trouble = false,
	cmp = true,
	lsp_saga = false,
	gitgutter = false,
	gitsigns = true,
	telescope = true,
	nvimtree = {
		enabled = true,
		show_root = false,
		transparent_panel = false,
	},
	neotree = {
		enabled = false,
		show_root = false,
		transparent_panel = false,
	},
	which_key = false,
	indent_blankline = {
		enabled = true,
		colored_indent_levels = false,
	},
	dashboard = true,
	neogit = false,
	vim_sneak = false,
	fern = false,
	barbar = false,
	bufferline = true,
	markdown = true,
	lightspeed = false,
	ts_rainbow = false,
	hop = false,
	notify = true,
	telekasten = true,
	symbols_outline = true,
  }}
EOF

let g:catppuccin_flavour = "mocha"
colorscheme catppuccin

" -- Telescope
lua << END
require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "node_modules", "dist", "ios", "build", "android" }
    }
}
END

" -- Lualine
lua << END
require('lualine').setup {
  extensions = { 'nvim-tree' },
  options = {
    disabled_filetypes = {'NvimTree'}
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
     dotfiles = true,
     exclude = { ".zshrc", ".gitconfig" },
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
set tabstop=2               " number of columns occupied by a tab
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
