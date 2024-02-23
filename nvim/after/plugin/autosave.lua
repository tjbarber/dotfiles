require("auto-save").setup {
    condition = function(buf)
	local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')

	if filetype == "harpoon" or filetype == "TelescopePrompt" then
	    return false
	end

	return true
    end
}
