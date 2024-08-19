vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>v', ':vsplit<CR>')
vim.keymap.set('n', '<leader>h', ':split<CR>')

vim.keymap.set('n', '<C-L>', ':bnext<CR>')
vim.keymap.set('n', '<C-H>', ':bprev<CR>')
vim.keymap.set('n', '<C-X>', ':bd<CR>')
