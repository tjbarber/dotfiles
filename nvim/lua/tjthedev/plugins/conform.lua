-- Automatically format/lint files

return {
	'stevearc/conform.nvim',
	config = function()
		local conform = require("conform")
		conform.setup({
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				lua = { "stylua" },
				ruby = { "rubocop" }
			},
		})
	end
}
