require('auto-save').setup({
    condition = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')

	if filetype == "harpoon" or filetype == "TelescopePrompt" then
	    return false
	end
    end
})
