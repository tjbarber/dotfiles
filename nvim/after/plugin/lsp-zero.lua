local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').solargraph.setup({
	cmd = { os.getenv('HOME') .. '/.asdf/shims/solargraph', 'stdio' },
	settings = {
		solargraph = {
			autoformat = true,
			completion = true,
			diagnostic = true,
			folding = true,
			references = true,
			rename = true,
			symbols = true
		}
	}
})

require('lspconfig').sourcekit.setup {
	cmd = { '/usr/bin/sourcekit-lsp' }
}

lsp.setup()
