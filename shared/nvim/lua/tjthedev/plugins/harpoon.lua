return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	requires = {
		{ 'nvim-lua/plenary.nvim' },
	},
	keys = {
		{ '<leader>a', function() require('harpoon'):list():add() end },
		{ '<C-y>', function()
			local harpoon = require('harpoon')
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end },
		{ '<C-h>',     function() require('harpoon'):list():select(1) end },
		{ '<C-j>',     function() require('harpoon'):list():select(2) end },
		{ '<C-k>',     function() require('harpoon'):list():select(3) end },
		{ '<C-l>',     function() require('harpoon'):list():select(4) end },
	},
	config = function()
		require('harpoon'):setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			}
		})
	end
}
