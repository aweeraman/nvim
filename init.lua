local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Load packer.nvim package manager
local packer = require("packer")

-- Define the plugins to be installed
packer.startup(function(use)
    use {"wbthomason/packer.nvim"}
    use {"airblade/vim-gitgutter"}
    use {"shougo/unite.vim"}
    use {"shougo/vimfiler.vim"}
    use {"bling/vim-bufferline"}
    use {"reedes/vim-pencil"}
    use {"junegunn/goyo.vim"}
    use {"tpope/vim-fugitive"}
    use {"ctrlpvim/ctrlp.vim"}
    use {"folke/tokyonight.nvim"}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
end)

-- Enable plugin features
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme tokyonight")

-- Set basic options
vim.o.hidden = true
vim.o.title = true
vim.bo.tabstop = 8
vim.bo.softtabstop = 8
vim.bo.shiftwidth = 8
vim.bo.expandtab = false
vim.wo.number = true
vim.o.mouse = "a"
vim.o.background = "dark"
vim.o.termguicolors = true

-- Set custom key mappings
vim.api.nvim_set_keymap("n", "<C-L>", ":bnext<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<C-H>", ":bprev<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<C-N>", ":tabnew<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<C-X>", ":bp <BAR> bd #<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<C-O>", ":VimFilerExplorer<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<F2>", ":Goyo <bar> <CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<F3>", ":SoftPencil <bar> <CR>", {silent = true})

-- Set plugin-specific options
vim.g.vimfiler_as_default_explorer = 1
vim.g.molokai_original = 1
