return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	branch = 'main',
	config = function()
		require('nvim-treesitter').install({
			'blade',
			'c',
			'crystal',
			'go',
			'html',
			'javascript',
			'json',
			'lua',
			'odin',
			'php',
			'php_only',
			'query',
			'ruby',
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
