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
	"nvim-treesitter/playground",
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
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},
	{
		-- integrate with lualine
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'linrongbin16/lsp-progress.nvim',
		},
	},
	'linrongbin16/lsp-progress.nvim',
	{ 'akinsho/toggleterm.nvim', version = "*", config = true },
  {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},
  'tpope/vim-endwise',
  { 'numToStr/Comment.nvim', lazy = false },
  { 'pocco81/auto-save.nvim', lazy = false },
}

require("lazy").setup(plugins)
