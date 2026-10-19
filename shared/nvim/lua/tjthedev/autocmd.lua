vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local bufmap = function(mode, rhs, lhs)
			vim.keymap.set(mode, rhs, lhs, {buffer = event.buf})
		end

		bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
		bufmap('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>')
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "ruby",
	callback = function()
		vim.keymap.set("n", "<leader>db", "Obinding.break<Esc>", { buffer = true, desc = "Insert binding.break" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function(event)
		vim.bo[event.buf].expandtab = false
		vim.bo[event.buf].shiftwidth = 4
		vim.bo[event.buf].softtabstop = 4
		vim.bo[event.buf].tabstop = 4
	end,
})

vim.api.nvim_create_user_command("LaravelIdeHelper", function()
	local root = vim.fs.root(0, "artisan")
	if not root then
		vim.notify("Not in a Laravel project", vim.log.levels.WARN)
		return
	end

	local function run(cmd, on_exit)
		vim.system(cmd, { cwd = root }, function(result)
			if result.code ~= 0 then
				vim.schedule(function()
					vim.notify(result.stderr ~= "" and result.stderr or table.concat(cmd, " ") .. " failed", vim.log.levels.ERROR)
				end)
				return
			end
			if on_exit then
				on_exit()
			end
		end)
	end

	run({ "lerd", "composer", "require", "--dev", "barryvdh/laravel-ide-helper" }, function()
		run({ "lerd", "artisan", "ide-helper:generate" }, function()
			run({ "lerd", "artisan", "ide-helper:models", "--nowrite" }, function()
				run({ "lerd", "artisan", "ide-helper:meta" }, function()
					vim.schedule(function()
						vim.notify("Laravel IDE Helper generated")
					end)
				end)
			end)
		end)
	end)
end, { desc = "Install and generate Laravel IDE Helper stubs" })

vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        vim.cmd("wincmd =")
    end,
})
