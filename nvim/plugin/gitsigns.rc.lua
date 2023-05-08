local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

gitsigns.setup {
	current_line_blame = true
}
