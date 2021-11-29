-- TOGGLETERM SETUP

local Terminal = require'toggleterm.terminal'.Terminal
local f = require'util.functions'
local map = f.map
local bmap = f.bmap
local cmd = vim.cmd

require('toggleterm').setup{
  open_mapping = [[<C-G>]],
  shading_factor = '3',
  size = 23,
  shade_terminals = true
}

function _G.set_terminal_keymaps()
  bmap('t', '<esc>', [[<C-\><C-n>]])
  bmap('t', '<C-S-h>', [[<C-\><C-n><C-W>h]])
  bmap('t', '<C-S-j>', [[<C-\><C-n><C-W>j]])
  bmap('t', '<C-S-k>', [[<C-\><C-n><C-W>k]])
  bmap('t', '<C-S-l>', [[<C-\><C-n><C-W>l]])
  bmap('t', '<C-S-G>', [[<C-\><C-n>:ToggleTermToggleAll<CR>]])
  map('n', '<C-S-G>', ':ToggleTermToggleAll<CR>')
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- CUSTOM TERMINALS
local function create_floating_term(cmd, keymap, id)
  local terminal = Terminal:new {
    cmd = cmd,
    direction = 'float',
    float_opts = { border = 'curved' },
    count = id
  }
  return terminal
end

-- LAZYGIT
local lazygit = create_floating_term('lazygit', '<Leader>k', 10)
function _lazygit_toggle()
  lazygit:toggle()
end
map('n', '<Leader>k', '<cmd>lua _lazygit_toggle()<CR>')

-- HTOP
local htop = create_floating_term('htop', '<Leader>h', 12)
function _htop_toggle()
  htop:toggle()
end
map('n', '<Leader>i', '<cmd>lua _htop_toggle()<CR>')

-- CTOP
local ctop = create_floating_term('ctop', '<Leader>c', 11)
function _ctop_toggle()
  ctop:toggle()
end
map('n', '<Leader>d', '<cmd>lua _ctop_toggle()<CR>')

