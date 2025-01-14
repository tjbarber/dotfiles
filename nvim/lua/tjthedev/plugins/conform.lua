-- Automatically format/lint files

return {
	'stevearc/conform.nvim',
	opts = {
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
	}
}
