-- golden retriver plugin

local builtin = require('telescope.builtin')

return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-telescope/telescope-ui-select.nvim',
		'nvim-lua/plenary.nvim',
	},
	keys = {
		{ '<leader>ff',       builtin.find_files },
		{ '<leader><leader>', builtin.git_files },
		{ '<leader>fg',       builtin.live_grep },
		{ '<leader>fs',       function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end },
		{ '<leader>b',        builtin.buffers },
		{ '<leader>fh',       builtin.help_tags },
		{ '<leader>s',        builtin.git_status },
		{ '<leader>/',        builtin.current_buffer_fuzzy_find },
		{ '<leader>qf',       builtin.quickfix },
	},
	config = function()
		require('telescope').setup()
		require('telescope').load_extension('ui-select')
	end
}
