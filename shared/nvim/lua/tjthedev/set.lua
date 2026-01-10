vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.foldcolumn = '1' -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.wildmode = 'longest:full,full' -- better tabbing completion in command mode
vim.opt.title = true

vim.opt.list = true -- enable the below listchars
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.fillchars:append({ eob = ' '})

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.clipboard = 'unnamedplus' -- use system clipboard

vim.opt.confirm = true

vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir:remove('.')

if vim.loop.os_uname().sysname == "Linux" and vim.fn.filereadable("/run/.toolboxenv") == 1 then
	vim.g.clipboard = {
		name = "wl-clipboard (host)",
		copy = {
			["+"] = { "flatpak-spawn", "--host", "wl-copy", "--type", "text/plain" },
			["*"] = { "flatpak-spawn", "--host", "wl-copy", "--type", "text/plain" },
		},
		paste = {
			["+"] = { "flatpak-spawn", "--host", "wl-paste", "--no-newline" },
			["*"] = { "flatpak-spawn", "--host", "wl-paste", "--no-newline" },
		},
		cache_enabled = 1,
	}
end
