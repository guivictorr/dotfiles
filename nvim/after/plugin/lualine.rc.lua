local present, lualine = pcall(require, 'lualine')
if not present then
	return
end

lualine.setup {
	options = {
		disabled_filetypes = {},
		section_separators = {},
		component_separators = {},
		always_divide_middle = true,
		globalstatus = false,
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
			icon = { color = { fg = '#ff0000' } }
		}, {
			'filename',
			padding = { left = 0, right = 2 }
		} },
		lualine_c = { {
			'branch',
			icon = { '', color = { fg = "#CC6666" } },
			padding = { right = 1, left = 0 }
		}, {
			'diff',
			symbols = { added = ' ', modified = ' ', removed = ' ' }
		} },
		lualine_x = { {
			'diagnostics',
			always_visible = true,
			sections = { 'error', 'hint', 'warn' },
			symbols = { error = ' ', hint = ' ', warn = ' ' }
		} },
		lualine_y = { {
			'hostname',
			icon = { ' ', color = { fg = '#CC6666' }, align = 'center' },
			padding = { right = 2, left = 1 }
		} },
		lualine_z = { {
			'location',
		}, {
			'progress',
			icon = ''
		} },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}
