vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>v', ':vsplit<CR>')
vim.keymap.set('n', '<leader>h', ':split<CR>')

vim.keymap.set('n', '<C-L>', ':tabn<CR>')
vim.keymap.set('n', '<C-H>', ':tabp<CR>')
vim.keymap.set('n', '<C-N>', ':tabnew<CR>')
vim.keymap.set('n', '<C-X>', ':bd<CR>')
