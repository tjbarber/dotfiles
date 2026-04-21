return {
	"nickjvandyke/opencode.nvim",
	version = "*", -- Latest stable release
	dependencies = {
		{
			"folke/snacks.nvim",
			optional = true,
			opts = {
				input = {}, -- Enhances `ask()`
				picker = { -- Enhances `select()`
					actions = {
						opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
					},
					win = {
						input = {
							keys = {
								["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
							},
						},
					},
				},
			},
		},
	},
	config = function()
		vim.g.opencode_opts = {}
		vim.o.autoread = true

		vim.keymap.set({ "n" }, "<leader>o", function() require("opencode").ask("@buffer: ", { submit = true }) end, { desc = "Ask opencode…" })
		vim.keymap.set({ "x" }, "<leader>o", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
		vim.keymap.set({ "n", "x" }, "<leader>ot", function() require("opencode").toggle() end, { desc = "Toggle opencode…" })
		vim.keymap.set({ "n", "x" }, "<leader>O", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
	end,
}
