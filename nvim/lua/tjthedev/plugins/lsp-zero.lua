-- LSP fun stuff

return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	dependencies = {
		-- LSP Support
		{ 'neovim/nvim-lspconfig' },
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'hrsh7th/nvim-cmp' },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-nvim-lua' },
		{ 'L3MON4D3/LuaSnip' },
	},
	config = function()
		local lsp = require('lsp-zero').preset({})

		lsp.on_attach(function(_, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp.default_keymaps({ buffer = bufnr })
		end)

		-- (Optional) Configure lua language server for neovim
		require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

		require('lspconfig').ruby_lsp.setup({
			cmd = { os.getenv('HOME') .. '/.asdf/shims/ruby-lsp', 'stdio' },
		})

		require('lspconfig').sourcekit.setup {
			cmd = { '/usr/bin/sourcekit-lsp' }
		}

		lsp.setup()
	end
}
