-- Gitsigns Setup
-- https://github.com/lewis6991/gitsigns.nvim#usage

local map = require('util.functions').map

require('gitsigns').setup()

map('n', '<Leader>gb', '<cmd>Gitsigns blame_line<CR>')
map('n', '<Leader>gs', '<cmd>Gitsigns stage_hunk<CR>')
map('n', '<Leader>gu', '<cmd>Gitsigns reset_hunk<CR>')
map('n', '<Leader>gn', '<cmd>Gitsigns next_hunk<CR>')
map('n', '<Leader>gp', '<cmd>Gitsigns prev_hunk<CR>')

