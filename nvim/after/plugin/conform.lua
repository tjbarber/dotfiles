require('conform').setup({
	formatters_by_ft = {
		blade = { 'blade-formatter' }
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
