-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

vim.keymap.set('n', '<leader>cp', function ()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("@", path)
  vim.notify('Copied "' .. path .. '" to the system clipboard!')
end)

vim.keymap.set('n', '<leader>h', '<Cmd>bprevious<CR>')
vim.keymap.set('n', '<leader>l', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<leader>w', '<Cmd>bd<CR>')
vim.keymap.set('n', '<leader>b', '<Cmd>Telescope buffers<CR>')

vim.keymap.set('n', ';;', '<Esc>A;<Esc>')
vim.keymap.set('n', ',,', '<Esc>A,<Esc>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
