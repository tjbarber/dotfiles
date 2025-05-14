-- Wisely add "end" in Ruby, Lua, Vimscript, etc

return {
	'RRethy/nvim-treesitter-endwise',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	config = function()
		require('nvim-treesitter.configs').setup {
			endwise = {
				enable = true,
			},
		}
	end
}
