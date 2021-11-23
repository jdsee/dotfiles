-- TOGGLETERM SETUP

local Terminal = require'toggleterm.terminal'.Terminal
local f = require'util.functions'
local map = f.map
local bmap = f.bmap
local cmd = vim.cmd

require('toggleterm').setup{
  open_mapping = [[<C-T>]],
  shading_factor = '2',
}

function _G.set_terminal_keymaps()
  bmap('t', '<esc>', [[<C-\><C-n>]])
  bmap('t', 'jk', [[<C-\><C-n>]])
  bmap('t', '<C-h>', [[<C-\><C-n><C-W>h]])
  bmap('t', '<C-j>', [[<C-\><C-n><C-W>j]])
  bmap('t', '<C-k>', [[<C-\><C-n><C-W>k]])
  bmap('t', '<C-l>', [[<C-\><C-n><C-W>l]])
end


-- LAZYGIT SETUP

local lazygit = Terminal:new {
  cmd = 'lazygit',
  direction = 'float',
  float_opts = { border = 'curved' },
}

function _lazygit_toggle()
  lazygit:toggle()
end

map('n', '<Leader>k', '<cmd>lua _lazygit_toggle()<CR>')

