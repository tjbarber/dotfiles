require('conform').setup({
	formatters_by_ft = {
		php = { 'blade-formatter', 'pint' }
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
