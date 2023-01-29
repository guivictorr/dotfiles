local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
	options = {
		mode = 'buffers',
		separator_style = 'thin',
		always_show_bufferline = true,
		show_close_icon = false,
		show_buffer_close_icons = false,
		color_icons = true,
		diagnostics = 'nvim_lsp',
		show_tab_indicators = true,
		diagnostics_indicator = function(count, level)
			local hintOrWarning = level:match("hint") and " " or " "
			local icon = level:match("error") and " " or hintOrWarning
			return icon .. count
		end,
		tab_size = 10,
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 14,
		max_prefix_length = 13,
	},
	highlights = {
		buffer = {
			bg = '#0a0a0b'
		},
		buffer_selected = {
			bg = '#151515',
			italic = false,
			bold = true
		},
		separator = {
			bg = '#0a0a0b',
		},
		indicator_selected = {
			fg = '#cc6666'
		}
	},
})
