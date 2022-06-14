-- NVIM-TREE SETUP

local map = require('util.functions').map
local neotree = require('neo-tree')

neotree.setup({
  window = {
    mappings = {
      ['o'] = 'open',
      ['<cr>'] = 'open',
      ["v"] = "open_vsplit",
    }
  }
})

vim.fn.sign_define("DiagnosticSignError",
  {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
  {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
  {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
  {text = "", texthl = "DiagnosticSignHint"})

map('n', '<C-I>', '<CMD>NeoTreeRevealToggle<CR>')
map('n', '<C-Q>', '<CMD>NeoTreeRevealToggle<CR>')
map('n', 'Q', '<CMD>Neotree<CR>')

