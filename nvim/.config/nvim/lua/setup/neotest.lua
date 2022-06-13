local map = require('util.functions').map
local neotest = require('neotest')
local M = {}

neotest.setup({
  icons = {
    running = ''
  },
})

M.run_file = function ()
  neotest.run.run(vim.fn.expand('%'))
end

M.debug = function ()
  neotest.run.run({ strategy = 'dap'})
end

map('n', '<Leader>te', 'M.run_file')
map('n', '<Leader>tj', 'neotest.run.run')
map('n', '<Leader>td', 'M.debug')
map('n', '<Leader>tx', 'neotest.run.stop')
map('n', '<Leader>to', 'neotest.output')
map('n', '<Leader>ts', 'neotest.summary.toggle')

