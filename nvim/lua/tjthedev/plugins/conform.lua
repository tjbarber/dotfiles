-- Automatically format/lint files

return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			format_after_save = {
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				lua = { "stylua" },
				ruby = { "rubocop" },
			},
			formatters = {
				rubocop = {
					args = {
						"--server",
						"-a",
						"-f",
						"quiet",
						"--except",
						"Lint/UselessAssignment,Style/EmptyMethod,Style/RedundantReturn",
						"--stderr",
						"--stdin",
						"$FILENAME",
					},
				},
			},
		})
	end,
}
