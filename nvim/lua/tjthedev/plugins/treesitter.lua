return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	dependencies = {
		{ 'nvim-treesitter/playground', cmd = "TSPlaygroundToggle" },
		{
			'JoosepAlviste/nvim-ts-context-commentstring',
			opts = {
				custom_calculation = function(_, language_tree)
					if vim.bo.filetype == 'blade' and language_tree._lang ~= 'javascript' then
						return '{{-- %s --}}'
					end
				end,
			},
		},
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	opts = {
		ensure_installed = {
			'c',
			'lua',
			'vim',
			'vimdoc',
			'query',
			'javascript',
			'ruby',
			'typescript',
			'php',
			'php_only',
			'html',
		},
		autotag = {
			enable = true,
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	},
	config = function(_, opts)
		require('nvim-treesitter.configs').setup(opts)

		local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
		parser_config.blade = {
			install_info = {
				url = 'https://github.com/EmranMR/tree-sitter-blade',
				files = { 'src/parser.c' },
				branch = 'main',
			},
			filetype = 'blade'
		}
		vim.filetype.add({
			pattern = {
				['.*%.blade%.php'] = 'blade',
			},
		})
	end
}
