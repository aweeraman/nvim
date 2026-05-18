vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.opt.termguicolors = true

vim.opt.title = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.cmdheight = 1

vim.opt.backup = false
vim.opt.autoread = true
vim.opt.autowrite = false

vim.opt.hidden = true
vim.opt.modifiable = true
vim.opt.encoding = "utf-8"
vim.opt.errorbells = false
vim.opt.path:append("**")
vim.opt.selection = "inclusive"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.diffopt:append("linematch:60")

local function git_branch()
	local dir = vim.fn.expand("%:p:h")
	if dir == "" then
		dir = vim.fn.getcwd()
	end
	local result = vim.fn.systemlist({ "git", "-C", dir, "rev-parse", "--abbrev-ref", "HEAD" })
	if vim.v.shell_error ~= 0 or #result == 0 then
		return ""
	end
	return result[1]
end

function _G.statusline_git()
	local branch = git_branch()
	if branch == "" then
		return ""
	end
	return " [" .. branch .. "]"
end

vim.opt.laststatus = 2
vim.opt.statusline = "%f%{v:lua.statusline_git()} %h%m%r%=%-14.(%l,%c%V%) %P"

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "FocusGained" }, {
	callback = function()
		vim.cmd("redrawstatus")
	end,
})

local yank_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Keymaps

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<space><space>x", ":.lua<CR>", { desc = "Execute line in lua" })
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>n", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>p", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<leader>t", ":Neotree toggle reveal<CR>", { desc = "Toggle Neotree" })

-- Plugins

-- onedark theme

vim.pack.add({
	{
		src = "https://github.com/navarasu/onedark.nvim",
		version = "v1.0.3",
	}
})

require("onedark").setup({
	style = 'warmer'
})

-- tokyonight theme

vim.pack.add({
	{
		src = "https://github.com/folke/tokyonight.nvim",
		version = "v4.14.1",
	}
})

require("tokyonight").setup()

-- set the theme
vim.cmd.colorscheme("onedark")

-- neo-tree

vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = "3.41.0"
	},
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
	filesystem = {
		follow_current_file = {
			enabled = true,
		},
	},
})

-- which-key.nvim
vim.pack.add({
	{
		src = "https://github.com/folke/which-key.nvim",
		version = "v3.17.0",
	}
})
require("which-key").setup()
