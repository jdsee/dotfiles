-- Gitsigns Setup
-- https://github.com/lewis6991/gitsigns.nvim#usage

local map = require('util.functions').map
local gs = require('gitsigns')

gs.setup()

map('n', '<Leader>g?', function() gs.blame_line{full=true} end)
map('n', '<Leader>gs', gs.stage_hunk)
map('n', '<Leader>gu', gs.reset_hunk)
map('n', '<Leader>gn', gs.next_hunk)
map('n', '<Leader>gp', gs.prev_hunk)
map('n', '<Leader>gd', function() gs.diffthis('~') end)

