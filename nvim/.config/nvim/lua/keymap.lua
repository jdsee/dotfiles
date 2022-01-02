-- | jdsee |
-- |-------------------------------------------------------------------------------
-- |  NEOVIM - KEYMAP
-- |-------------------------------------------------------------------------------

local f = require 'util.functions'
local map = f.map

vim.g.mapleader = ' '

-- General
map('n', '<C-C>', ':noh<CR>', { nowait = true })                  -- remove visual selection

-- Reload neovim
function ReloadModules()
  package.loaded.settings = nil
  package.loaded.plugins = nil
  package.loaded.keymap = nil
  package.loaded.autocommands = nil
  package.loaded.setup = nil
  package.loaded.lsp = nil
  package.loaded.util = nil
  print('Reloaded neovim config.')
end
map('n', '<F5>', '<cmd>lua ReloadModules()<CR>:luafile ~/.config/nvim/init.lua<CR>')

-- Navigation
map('n', 'k', "v:count == -1 ? 'gk' : 'k'", { expr = true })      -- move up wrapped line
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })       -- move down wrapped line
map('n', '<Leader>e', '$')                                        -- move to end of line

-- Text actions
map('n', '<Leader>i', 'i_<Esc>r')                                 -- insert single character

-- Files
map ('n', 'gf', ':edit <cfile><cr>')                              -- open non existing files with gf

-- Windows / Tabs
map('n', '<M-K>', '<C-W>k')                                       -- go window up
map('n', '<M-J>', '<C-W>j')                                       -- go window down
map('n', '<M-H>', '<C-W>h')                                       -- go window lelft
map('n', '<M-L>', '<C-W>l')                                       -- go window right
map('n', 'tt', ':tab split<CR>')                                  -- open in new tab

-- Buffers
map('n', '<C-.>', ':bd<CR>')                                      -- close buffer
map('n', '<C-,>', ':bd<CR>')                                      -- close buffer
map('n', '<C-S-W>', ':bd<CR>')                                    -- close buffer

-- Clipboard
map('n', '<Leader>y', '"*y')                                      -- copy to system clipboard
map('n', '<Leader>p', '"*p')                                      -- paste from system clipboard
map('n', '<Leader>s', '"*s')                                      -- substitute from system clipboard

-- Refactoring
map('x', '<Leader>r', '<Leader>siwa<CR>') -- TODO: not working    -- rename single word/term
map('n', '<A-j>', ':m .+1<CR>==')                                 -- move line down
map('n', '<A-k>', ':m .-2<CR>==')                                 -- move line up
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')                          -- move line down
map('i', '<A-k>', ':m .+1<CR>==')                                 -- move line up
map('v', '<A-j>', ":m '>+1<CR>gv=gv")                             -- move line down
map('v', '<A-k>', ":m '<-2<CR>gv=gv")                             -- move line up

-- Custom text objects
map('o', 'ae', ':exec "normal! ggVG"<CR>')                        -- whole buffer text object
map('o', 'ie', ':exec "normal! ggVG"<CR>')                        ---

