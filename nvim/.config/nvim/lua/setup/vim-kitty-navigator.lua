-- VIM KITTY NAVIGATOR

-- Command Key not yet working in terminal :(
--------------------------------------------------
local f = require 'util.functions'
local map = f.map
local cmd = vim.cmd

cmd [[
  let g:kitty_navigator_no_mappings = 1
]]
map('n', '<S-C-j>', ':KittyNavigateDown<CR>')
map('n', '<S-C-k>', ':KittyNavigateUp<CR>')
map('n', '<S-C-h>', ':KittyNavigateLeft<CR>')
map('n', '<S-C-l>', ':KittyNavigateRight<CR>')

-- map('n', '<C-S-K>', '<C-W>k')                                     -- go window up
-- map('n', '<C-S-J>', '<C-W>j')                                     -- go window down
-- map('n', '<C-S-H>', '<C-W>h')                                     -- go window lelft
-- map('n', '<C-S-L>', '<C-W>l')                                     -- go window right

