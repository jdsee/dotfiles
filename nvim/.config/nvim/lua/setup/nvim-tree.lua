-- NVIM-TREE SETUP

local map = vim.api.nvim_set_keymap

require'nvim-tree'.setup {
  hijack_cursor = true,
}

map('n', '<C-F>', ':NvimTreeToggle<CR>', { noremap = true})
map('n', '<Leader>t', ':NvimTreeToggle<CR>', { noremap = true})
map('n', '<Leader>!', ':NvimTreeRefresh<CR>', { noremap = true})
map('n', '<Leader>?', ':NvimTreeFindFile<CR>', { noremap = true})

