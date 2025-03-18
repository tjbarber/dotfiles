return {
	'echasnovski/mini.statusline',
	dependencies = {
		'echasnovski/mini.icons',
	},
	config = function()
		local noirbuddy_statusline = require('noirbuddy.plugins.mini-statusline')

		require('mini.statusline').setup {
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local oil_path      = require("oil").get_current_dir() or ""
					local display_path  = vim.fn.fnamemodify(oil_path, ":~")

					if vim.bo.filetype == 'oil' then
						return MiniStatusline.combine_groups({
							{ hl = mode_hl,                 strings = { mode } },
							{ hl = 'MiniStatuslineDevinfo', strings = { display_path } },
							'%<',
						})
					end

					return noirbuddy_statusline.active()
				end,
				inactive = noirbuddy_statusline.inactive,
			},
		}
	end
}
