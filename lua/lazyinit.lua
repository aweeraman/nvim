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
		keys = {
				{ "<leader>o", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		},
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
		keys = {
				{ "<leader>dd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
				{ "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
				{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
		},
	},
	{
		'stevearc/aerial.nvim',
		opts = {},
		keys = {
				{ "<leader>a", "<cmd>AerialToggle!<cr>", desc = "Aerial Toggle" },
		},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
				{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope Live Grep" },
				{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers" },
		},
	}
})
