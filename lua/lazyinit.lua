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

require('lazy').setup({
	{
		'navarasu/onedark.nvim',
		config = function()
			require('onedark').setup {
				style = 'warmer'
			}
			require('onedark').load()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			vim.keymap.set('n', '<C-O>', ':Neotree toggle<CR>')
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = false,
				component_separators = '|',
				section_separators = '',
			},
		},
	},
	{
		'sindrets/diffview.nvim',
		config = function()
			vim.keymap.set('n', '<C-D>', ':DiffviewOpen<CR>')
			vim.keymap.set('n', '<C-H>', ':DiffviewFileHistory<CR>')
			vim.keymap.set('n', '<leader>c', ':DiffviewClose<CR>')
		end,
	}
})
