return {
	{
		"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
		config = function ()
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true
				},
				autopairs = {
					enabled = true
				},
				autotag = {
					enabled = true
				},
				auto_install = true,
				indent = { enable = true },
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
					"typescript"
        },
			})
		end
	}
}
