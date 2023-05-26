return {
	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			local lualine = require('lualine')
			lualine.setup {
				options = {
					always_divide_middle = true,
					component_separators = {},
					section_separators = {}
				},
				sections = {
					lualine_a = { {
						'mode',
						icons_enabled = true,
						icon = '',
						padding = { left = 2, right = 2 }
					} },
					lualine_b = { {
						'filetype',
						icon_only = true,
						padding = { left = 2, right = 1 },
					}, {
						'filename',
						file_status = false,
						new_file_status = false,
						padding = { left = 0, right = 2 },
						symbols = {
							modified = '[+]', -- Text to show when the file is modified.
							readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
							unnamed = '  [No Name]', -- Text to show for unnamed buffers.
							newfile = '  [New]', -- Text to show for newly created file before first write
						}
					} },
					lualine_c = { {
						'branch',
						icon = { '' },
						padding = { right = 1, left = 2 }
					}, {
						'diff',
						symbols = { added = ' ', modified = ' ', removed = ' ' }
					} },
					lualine_x = { {
						'diagnostics',
						always_visible = true,
						sections = { 'error', 'hint', 'warn' },
						symbols = { error = ' ', hint = ' ', warn = ' ' },
						padding = { right = 2 }
					} },
					lualine_y = { {
						'hostname',
						icon = { ' ', align = 'center' },
						padding = { right = 2, left = 2 }
					} },
					lualine_z = { {
						'location',
						padding = { left = 1, right = 1 }
					}, {
						'progress',
						icon = '',
						padding = { right = 2 }
					} },
				},
				tabline = {},
				extensions = {},
			}
		end
	}
}
