local status, startup = pcall(require, 'startup')
if (not status) then return end

local function time()
	local clock = " " .. os.date "%H:%M"
	local date = os.date(" Today is %a %d %b")
	return { clock, date }
end

startup.setup({
	-- every line should be same width without escaped \
	header = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 5,
		content = {
			" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
			" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
			" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
			" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
			" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
		},
		highlight = "Number",
		default_color = "",
		oldfiles_amount = 0,
	},
	quote = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 0,
		content = {
			"Como pode um cara escrever uma coisa que eu não entenda?",
			"não tem como! eu vou ler aquela merda até entender!",
			"Isso é brio.",
			"",
			"                                        ― Clovis de Barros Filho"
		},
		highlight = "Function",
		default_color = "",
		oldfiles_amount = 0,
	},
	-- name which will be displayed and command
	body = {
		type = "mapping",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Basic Commands",
		margin = 5,
		content = {
			{ " Find File",    "Telescope find_files",   "<leader>ff" },
			{ " Find Word",    "Telescope live_grep",    "<leader>fg" },
			{ " File Browser", "Telescope file_browser", "<leader>sf" },
		},
		highlight = "String",
		default_color = "",
		oldfiles_amount = 0,
	},
	footer = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Footer",
		margin = 5,
		content = time(),
		highlight = "Number",
		default_color = "",
		oldfiles_amount = 0,
	},
	options = {
		mapping_keys = true,
		cursor_column = 0.5,
		empty_lines_between_mappings = true,
		disable_statuslines = false,
		paddings = { 4, 1, 2, 2 },
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "o",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
	},
	colors = {
		background = "#151515",
		folded_section = "#56b6c2",
	},
	parts = { "header", "quote", "body", "footer" },
})
