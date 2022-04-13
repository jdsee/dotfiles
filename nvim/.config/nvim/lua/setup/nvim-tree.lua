-- NVIM-TREE SETUP

local map = require('util.functions').map

require'nvim-tree'.setup {
  hijack_cursor = true,
}

map('n', '<C-S>', ':NvimTreeToggle<CR>')
map('n', '<Leader>!', ':NvimTreeRefresh<CR>')
map('n', '<Leader>?', ':NvimTreeFindFile<CR>')

