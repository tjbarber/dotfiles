return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "intelephense" },
		automatic_enable = {
			exclude = { "phpactor" },
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = { PATH = "append" } },
		"neovim/nvim-lspconfig",
	},
	config = function(_, opts)
		vim.lsp.config("intelephense", {
			filetypes = { "php" },
			settings = {
				intelephense = {
					files = {
						maxSize = 5000000,
					},
				},
			},
		})

		require("mason-lspconfig").setup(opts)

		-- SourceKit-LSP for Swift (comes with Xcode on macOS, or Swift toolchain on Linux)
		vim.lsp.config("sourcekit", {
			cmd = { "sourcekit-lsp" },
			filetypes = { "swift", "objective-c", "objective-cpp" },
			root_markers = { "Package.swift", ".git", "compile_commands.json", "buildServer.json" },
		})
		vim.lsp.enable("sourcekit")

		vim.lsp.config("laravel_lsp", {
			cmd = { "laravel-lsp" },
			filetypes = { "php", "blade" },
			root_dir = function(bufnr, on_dir)
				local root = vim.fs.root(bufnr, "artisan")

				if root then
					on_dir(root)
				end
			end,
			init_options = {
				phpCommand = { "lerd", "php" },
			},
		})
		vim.lsp.enable("laravel_lsp")
	end,
}
