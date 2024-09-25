-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set('n', 'zR', requi'user.plugins.ufo'ser.plugin.ufo'.plugin.ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', requi'user.plugins.ufo'ser.plugin.ufo'.plugin.ufo').closeAllFolds)
--
vim.keymap.set('n', '<leader>cp', function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the system clipboard!')
end)

vim.keymap.set('n', '<leader>w', '<Cmd>bd<CR>')

vim.keymap.set('n', ';;', '<Esc>A;<Esc>')
vim.keymap.set('n', ',,', '<Esc>A,<Esc>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.code_action()
end)

vim.keymap.set('n', '<C-Space>', '<Cmd>terminal<CR>a')
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
