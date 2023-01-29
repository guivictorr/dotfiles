local present, telescope = pcall(require, "telescope")
if not present then
	return
end

local present_, actions = pcall(require, "telescope.actions")
if not present_ then
	return
end

vim.g.theme_switcher_loaded = true

telescope.setup({
	defaults = {
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.5,
				results_width = 0.5,
				width = 0.7,
				height = 0.85,
			},
		},
		winblend = 0,
		border = true,
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		color_devicons = true,
		mappings = {
			i = {
				["<C-n>"] = actions.move_selection_next,
				["<C-e>"] = actions.move_selection_previous,
			},

			n = {
				["q"] = actions.close,

				["n"] = actions.move_selection_next,
				["e"] = actions.move_selection_previous,

				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,
			},
		},
	},
	extensions = {
		file_browser = {
			hijack_netrw = true,
			cwd = vim.fn.expand('%:p:h'),
			path = "%:p:h",
			respect_gitignore = true
		}
	}
})
