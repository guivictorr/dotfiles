local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

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
