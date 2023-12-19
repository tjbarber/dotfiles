local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'nvim-telescope/telescope.nvim',
  'nvim-lua/plenary.nvim',
  'navarasu/onedark.nvim',
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-tree/nvim-web-devicons',
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"saadparwaiz1/cmp_luasnip"},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'linrongbin16/lsp-progress.nvim',
    },
  },
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},
  { 'numToStr/Comment.nvim', lazy = false },
  -- { 'pocco81/auto-save.nvim', lazy = false },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  'windwp/nvim-ts-autotag',
  'jwalton512/vim-blade',
  {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
}

require("lazy").setup(plugins)
