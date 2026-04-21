vim.keymap.set("n", "<leader>w", "<Cmd>bd<CR>")
vim.keymap.set("n", ";;", "<Esc>A;<Esc>")
vim.keymap.set("n", ",,", "<Esc>A,<Esc>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>nt", "<Cmd>terminal<CR>a")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.code_action()
end)

vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float()
end)

vim.keymap.set("n", "<C-Space>", function()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) then
			local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
			if buftype == "terminal" then
				vim.api.nvim_set_current_buf(buf)
				return
			end
		end
	end

	vim.cmd("terminal")
	vim.cmd("startinsert")
end)

vim.keymap.set("n", "<leader>cp", function()
	local path = vim.fn.expand("%:.")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the system clipboard!')
end)
