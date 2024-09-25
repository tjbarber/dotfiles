-- Laravel forever!

return {
	'adalessa/laravel.nvim',
	dependencies = {
		'nvim-telescope/telescope.nvim',
		'tpope/vim-dotenv',
		'MunifTanjim/nui.nvim',
		'nvimtools/none-ls.nvim',
	},
	cmd = { 'Sail', 'Artisan', 'Composer', 'Npm', 'Yarn', 'Laravel' },
	keys = {
		{ '<leader>la', ':Laravel artisan<cr>' },
		{ '<leader>lr', ':Laravel routes<cr>' },
		{ '<leader>lm', ':Laravel related<cr>' },
		{ '<leader>lg', function()
			local run = require 'laravel.run'
			run('artisan', { 'ide-helper:generate' }, {})
			run('artisan', { 'ide-helper:models' }, {})
		end },
	},
	event = { 'VeryLazy' },
	config = true,
}
