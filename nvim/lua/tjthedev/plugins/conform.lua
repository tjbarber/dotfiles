-- Automatically format/lint files

return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			blade = { 'prettierd' }
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},

	}
}