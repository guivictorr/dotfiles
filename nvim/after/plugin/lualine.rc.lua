local present, lualine = pcall(require, 'lualine')
if not present then
	return
end

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
			padding = { left = 0, right = 2 }
		} },
		lualine_c = { {
			'branch',
			icon = { '', color = { fg = "#CC6666" } },
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
			icon = { ' ', color = { fg = '#CC6666' }, align = 'center' },
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
