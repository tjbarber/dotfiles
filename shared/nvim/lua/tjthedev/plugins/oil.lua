-- File navigation

return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
    },
    use_default_keymaps = true,
    view_options = {
      show_hidden = true,
    },
  }
}
