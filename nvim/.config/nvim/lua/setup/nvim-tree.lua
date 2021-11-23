-- NVIM-TREE SETUP

local map = vim.api.nvim_set_keymap

require'nvim-tree'.setup {}

map('n', '<A-1>', ':NvimTreeToggle<CR>', { noremap = true})
map('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true})
map('n', '<Leader>!', ':NvimTreeRefresh<CR>', { noremap = true})
map('n', '<Leader>?', ':NvimTreeFindFile<CR>', { noremap = true})

