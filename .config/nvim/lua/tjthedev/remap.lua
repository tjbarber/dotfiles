-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

vim.keymap.set('n', '<leader>cp', function ()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("@", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end)
