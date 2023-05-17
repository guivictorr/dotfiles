local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		config = function()
			local lsp = require('lsp-zero').preset({})

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
				lsp.buffer_autoformat()
			end)

			require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

			lsp.setup()

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local cmp = require('cmp')
			cmp.setup({
				formatting = {
					fields = { 'kind', 'abbr', 'menu' },
					format = function(_, vim_item)
						local kind = vim_item.kind
						vim_item.kind = (kind_icons[kind] or "?") .. " "
						vim_item.menu = " " .. kind .. " "
						return vim_item
					end
				},
				window = {
					completion = cmp.config.window.bordered({
						scrollbar = false,
						winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
					}),
					documentation = cmp.config.window.bordered()
				},
				mapping = cmp.mapping.preset.insert({
					['<C-d>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-p'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.close(),
					['<s-tab>'] = cmp.mapping.select_prev_item(),
					['<tab>'] = cmp.mapping.select_next_item(),
					['<CR>'] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true
					}),
				}),
			})
		end,
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Requiredlsp
			{
				-- Optional
				'williamboman/mason.nvim',
				build = ":MasonUpdate"
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{
				'hrsh7th/nvim-cmp'
			},
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = true,
					separator = "  ",
				},
			})

			local opts = { noremap = true, silent = true }
			vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
			vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
			vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
			vim.keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
			vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
			vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
			vim.keymap.set('n', 'gf', '<Cmd>Lspsaga lsp_finder<CR>', opts)

			-- code action
			local codeaction = require("lspsaga.codeaction")
			vim.keymap.set("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })

			-- treesitter
			local ts = require('nvim-treesitter.configs')
			ts.setup {
				autopairs = {
					enable = true
				},
				highlight = {
					enable = true,
					disable = {},
				},
				indent = {
					enable = true,
					disable = {},
				},
				ensure_installed = {
					"markdown",
					"markdown_inline",
					"tsx",
					"json",
					"yaml",
					"css",
					"html",
					"lua",
					"javascript",
					"typescript",
					"tsx"
				},
				autotag = {
					enable = true,
				},
			}
			local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
			parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",

		}
	},
}
