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
				javascript = { "oxfmt" },
				javascriptreact = { "oxfmt" },
				typescript = { "oxfmt" },
				typescriptreact = { "oxfmt" },
				lua = { "stylua" },
				ruby = { "rubocop" },
				swift = { "swiftformat" },
			},
			formatters = {
				rubocop = {
					args = {
						"--server",
						"-a",
						"-f",
						"quiet",
						"--except",
						"Lint/UselessAssignment,Lint/Void,Style/EmptyMethod,Style/RedundantReturn",
						"--stderr",
						"--stdin",
						"$FILENAME",
					},
				},
			},
		})
	end,
}
