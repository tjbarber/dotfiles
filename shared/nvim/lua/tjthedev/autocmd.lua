vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local bufmap = function(mode, rhs, lhs)
			vim.keymap.set(mode, rhs, lhs, {buffer = event.buf})
		end

		bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
		bufmap('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>')
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "ruby",
	callback = function()
		vim.keymap.set("n", "<leader>db", "Obinding.break<Esc>", { buffer = true, desc = "Insert binding.break" })
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        vim.cmd("wincmd =")
    end,
})
