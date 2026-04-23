return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	branch = 'main',
	config = function()
		-- Add runtime subdirectory to runtimepath so queries are found
		-- (main branch stores queries in runtime/queries/ instead of queries/)
		local ts_path = vim.fn.stdpath('data') .. '/lazy/nvim-treesitter'
		vim.opt.runtimepath:append(ts_path .. '/runtime')
		-- Register crystal parser from external repo (not yet upstream)
		vim.api.nvim_create_autocmd("User", {
			pattern = 'TSUpdate',
			callback = function()
				require('nvim-treesitter.parsers').crystal = {
					install_info = {
						url = 'https://github.com/crystal-lang-tools/tree-sitter-crystal',
						generate = false,
						generate_from_json = false,
						queries = 'queries/nvim'
					},
				}
			end,
		})

		vim.treesitter.language.register("crystal", { "cr" })

		require('nvim-treesitter').setup({
			ensure_installed = {
				'c',
				'crystal',
				'go',
				'html',
				'javascript',
				'json',
				'lua',
				'odin',
				'php',
				'php_only',
				'query',
				'ruby',
				'swift',
				'tsx',
				'typescript',
				'vim',
				'vimdoc',
			},
			sync_install = false,
			auto_install = true,
		})

		vim.api.nvim_create_autocmd('FileType', {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end
}
