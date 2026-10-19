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
				c = { "clang-format" },
				javascript = { "oxfmt" },
				javascriptreact = { "oxfmt" },
				typescript = { "oxfmt" },
				typescriptreact = { "oxfmt" },
				lua = { "stylua" },
				php = { "pint" },
				ruby = { "rubocop" },
				swift = { "swiftformat" },
			},
			formatters = {
				["clang-format"] = {
					args = function(_, ctx)
						local has_style = #vim.fs.find({ ".clang-format", "_clang-format" }, {
							path = vim.fs.dirname(ctx.filename),
							upward = true,
						}) > 0
						return {
							"-assume-filename", "$FILENAME",
							"--style=" .. (has_style and "file" or "{BasedOnStyle: LLVM, UseTab: Always, IndentWidth: 4, TabWidth: 4}"),
						}
					end,
				},
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
