require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon",
  },
  -- Set to false to disable all of the above keymaps
  use_default_keymaps = true,
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  },
})
