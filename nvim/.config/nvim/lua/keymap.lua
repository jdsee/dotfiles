-- | jdsee |
-- |-------------------------------------------------------------------------------
-- |  NEOVIM - KEYMAP
-- |-------------------------------------------------------------------------------

local f = require 'util.functions'
local map = f.map

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

-- General
map('n', '<C-C>', ':noh<CR>', { nowait = true })                  -- remove visual selection

-- Navigation
map('n', 'k', "v:count == -1 ? 'gk' : 'k'", { expr = true })      -- move up wrapped line
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })       -- move down wrapped line

-- Text actions
map('n', '<Leader>i', 'i_<Esc>r')                                 -- insert single character
map('n', '<BS>', '0D')                                            -- delete whole line content
map('n', '<Leader>o', 'o<Esc>')                                   -- insert line below in normal mode
map('n', '<Leader>O', 'O<Esc>')                                   -- insert line above in normal mode

-- Files
map ('n', 'gf', ':edit <cfile><cr>')                              -- open non existing files with gf

-- Windows / Tabs
map('n', '<M-K>', '<C-W>k')                                       -- go window up
map('n', '<M-J>', '<C-W>j')                                       -- go window down
map('n', '<M-H>', '<C-W>h')                                       -- go window lelft
map('n', '<M-L>', '<C-W>l')                                       -- go window right
map('n', 'tt', ':tab split<CR>')                                  -- open in new tab
map('n', '<Leader>q', ':bd!<CR>')                                 -- close curent buffer
map('t', '<C-W>', '<C-\\><C-N><C-W>')                             -- window management in terminal mode

-- Buffers
map('n', '<C-,>', ':bd<CR>')                                      -- close buffer

-- Clipboard
map('n', '<Leader>y', '"*y')                                      -- copy to system clipboard
map('n', '<Leader>p', '"*p')                                      -- paste from system clipboard
map('n', '<Leader>s', '"*s')                                      -- substitute from system clipboard

-- Refactoring
map('n', '<A-S-j>', ':m .+1<CR>==')                               -- move line down
map('n', '<A-S-k>', ':m .-2<CR>==')                               -- move line up
map('i', '<A-S-j>', '<Esc>:m .+1<CR>==gi')                        -- move line down
map('i', '<A-S-k>', ':m .+1<CR>==')                               -- move line up
map('v', '<A-S-j>', ":m '>+1<CR>gv=gv")                           -- move line down
map('v', '<A-S-k>', ":m '<-2<CR>gv=gv")                           -- move line up

-- Custom text objects
map('o', 'ae', ':exec "normal! ggVG"<CR>')                        -- whole buffer text object
map('o', 'ie', ':exec "normal! ggVG"<CR>')                        ---

