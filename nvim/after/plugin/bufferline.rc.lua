local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
	options = {
		mode = 'buffers',
		separator_style = 'thin',
		always_show_bufferline = true,
		color_icons = true,
		show_close_icon = false,
		diagnostics = 'nvim_lsp',
	},
	highlights = {
		buffer_selected = {
			italic = false,
			bold = true
		}
	},
})
