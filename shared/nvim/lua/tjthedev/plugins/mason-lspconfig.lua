return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function(_, opts)
		require("mason-lspconfig").setup(opts)

		-- SourceKit-LSP for Swift (comes with Xcode on macOS, or Swift toolchain on Linux)
		vim.lsp.config("sourcekit", {
			cmd = { "sourcekit-lsp" },
			filetypes = { "swift", "objective-c", "objective-cpp" },
			root_markers = { "Package.swift", ".git", "compile_commands.json", "buildServer.json" },
		})
		vim.lsp.enable("sourcekit")
	end,
}
