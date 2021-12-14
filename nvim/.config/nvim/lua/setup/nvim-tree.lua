-- NVIM-TREE SETUP

local f = require 'util.functions'
local map = f.map

require'nvim-tree'.setup {
  hijack_cursor = true,
}

map('n', '<C-T>', ':NvimTreeToggle<CR>')
map('n', '<Leader>t', ':NvimTreeToggle<CR>')
map('n', '<Leader>!', ':NvimTreeRefresh<CR>')
map('n', '<Leader>?', ':NvimTreeFindFile<CR>')

