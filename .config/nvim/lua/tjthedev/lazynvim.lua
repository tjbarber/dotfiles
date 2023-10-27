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
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
  "navarasu/onedark.nvim",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"tpope/vim-fugitive",
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
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
  { 'pocco81/auto-save.nvim', lazy = false },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  'windwp/nvim-ts-autotag',
}

require("lazy").setup(plugins)
