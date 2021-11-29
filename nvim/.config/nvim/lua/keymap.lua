-- | jdsee |
-- |-------------------------------------------------------------------------------
-- |  NEOVIM - KEYMAP
-- |-------------------------------------------------------------------------------

local f = require 'util.functions'
local map = f.map

vim.g.mapleader = ' '

-- General
map('n', '<C-S>', ':w<CR>')                                       -- save
map('i', '<C-S>', '<Esc>:w<CR>a')                                 -- save
map('n', '<C-S-S>', ':wa<CR>')                                    -- save
map('i', '<C-S-S>', '<Esc>:wa<CR>a')                              -- save
map('n', '<C-C>', ':noh<CR>', { nowait = true })                  -- remove visual selection

-- Reload NVIM (TODO: not working)
vim.cmd[[command! Src lua require('plenary.reload').reload_module('setup', true)]]

-- Navigation
map('n', 'k', 'gk')                                               -- move up wrapped line
map('n', 'j', 'gj')                                               -- move down wrapped line
map('n', '<Leader>e', '$')                                        -- move to end of line

-- Windows / Tabs
map('n', '<C-S-K>', '<C-W>k')                                     -- go window up
map('n', '<C-S-J>', '<C-W>j')                                     -- go window down
map('n', '<C-S-H>', '<C-W>h')                                     -- go window lelft
map('n', '<C-S-L>', '<C-W>l')                                     -- go window right
map('n', '<C-S-W>', '<C-W>q')                                     -- close window
map('n', 'tt', ':tab split<CR>')                                  -- open in new tab

-- Buffers
map('n', '<C-.>', ':bd<CR>')                                      -- close buffer
map('n', '<C-,>', ':bd<CR>')                                      -- close buffer
map('n', '<C-W>', ':bd<CR>')                                      -- close buffer

-- Clipboard
map('n', '<Leader>y', '"*y')                                      -- copy to system clipboard
map('n', '<Leader>p', '"*p')                                      -- paste from system clipboard
map('n', '<Leader>s', '"*s')                                      -- substitute from system clipboard

-- Refactoring
map('x', '<Leader>r', '<Leader>siwa<CR>') -- TODO: not working    -- rename single word/term

