-- Auto saving

return {
	'okuuva/auto-save.nvim',
	opts = {},
	config = function()
		require("auto-save").setup {
			condition = function(buf)
				local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })

				if filetype == "harpoon" or filetype == "TelescopePrompt" then
					return false
				end

				return true
			end
		}
	end
}
