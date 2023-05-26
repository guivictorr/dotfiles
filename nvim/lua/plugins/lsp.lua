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
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				-- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		},
		config = function()
			local lsp = require('lsp-zero').preset("recommended")

			lsp.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }
				lsp.buffer_autoformat()
				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				vim.keymap.set("n", "<C-j>", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
				vim.keymap.set("n", "<C-k>", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
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
		end

	},
}
