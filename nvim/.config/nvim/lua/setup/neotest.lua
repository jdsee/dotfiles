local map = require('util.functions').map
local neotest = require('neotest')
local M = {}

neotest.setup({
  adapters = {
    -- require('neotest-python'),
    require('neotest-plenary'),
    require('neotest-vim-test')({
      ignore_file_types = { --[[ 'python',  ]]'vim', 'lua' },
    }),
  },
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

map('n', '<Leader>te', M.run_file)
map('n', '<Leader>ta', M.run_file)
map('n', '<Leader>tj', neotest.run.run)
map('n', '<Leader>tt', neotest.run.run_last)
map('n', '<Leader>td', M.debug)
map('n', '<Leader>tx', neotest.run.stop)
map('n', '<Leader>to<ESC>', neotest.output.open)
map('n', '<Leader>ts', neotest.summary.toggle)

