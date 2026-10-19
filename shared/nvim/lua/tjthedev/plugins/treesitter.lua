return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	branch = 'main',
	config = function()
		require('nvim-treesitter').install({
			'c',
			'go',
			'html',
			'javascript',
			'json',
			'lua',
			'query',
			'ruby',
			'rust',
			'swift',
			'tsx',
			'typescript',
			'vim',
			'vimdoc',
		})

		vim.api.nvim_create_autocmd('FileType', {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end
}
