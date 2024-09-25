-- Git wrapper

return {
	'tpope/vim-fugitive',
	keys = {
		{ '<leader>gs', vim.cmd.Git },
	},
	lazy = false,
	config = function()
		vim.api.nvim_create_user_command(
			'Browse',
			function(opts)
				vim.fn.system { 'xdg-open', opts.fargs[1] }
			end,
			{ nargs = 1 }
		)
	end
}
