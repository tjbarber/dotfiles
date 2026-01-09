return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	branch = 'main',
	config = function()
		require('nvim-treesitter').setup({
			ensure_installed = {
				'c',
				'go',
				'html',
				'javascript',
				'json',
				'lua',
				'php',
				'php_only',
				'query',
				'ruby',
				'typescript',
				'vim',
				'vimdoc',
			},
			sync_install = false,
			auto_install = true,
		})

		vim.api.nvim_create_autocmd('FileType', {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end
}
