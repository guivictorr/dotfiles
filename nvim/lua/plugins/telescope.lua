return {
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},

	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		config = function()
			local telescope = require('telescope')
			local actions = require("telescope.actions")
			local fb_actions = require "telescope".extensions.file_browser.actions
			telescope.setup({
				defaults = {
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
						n = {
							["q"] = actions.close,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,
						},
					},
				},
				extensions = {
					file_browser = {
						theme = "dropdown",
						hijack_netrw = true,
						mappings = {
							["n"] = {
								["N"] = fb_actions.create,
								["h"] = fb_actions.goto_parent_dir,
							},
						},
					},
				},
			})

			local function telescope_buffer_dir()
				return vim.fn.expand('%:p:h')
			end

			telescope.load_extension("file_browser")

			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

			vim.keymap.set("n", "<leader>sf", function()
				telescope.extensions.file_browser.file_browser({
					path = '%:p:h',
					cwd = telescope_buffer_dir(),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 40 },
					git_status = false
				})
			end)
		end,
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
}