local map = require('util.functions').map
local neotest = require('neotest')
local M = {}

neotest.setup({
  adapters = {
    require('neotest-python'),
    require('neotest-plenary'),
    require('neotest-vim-test')({
      ignore_file_types = { 'python', 'vim', 'lua' },
    }),
  },
  summary = {
    mappings = {
      output = 'O',
      short = 'o'
    }
  },
  icons = {
    running = ''
  },
})

M.run_all = function ()
  neotest.run.run(vim.fn.expand('%'))
end

M.run_all_in_file = function ()
  neotest.run.run(vim.fn.getcwd())
end

M.debug = function ()
  neotest.run.run({ strategy = 'dap'})
end

M.toggle_summary = function ()
  neotest.summary.toggle({ short = true })
end

map('n', '<Leader>tf', M.run_all_in_file)
map('n', '<Leader>ta', M.run_all)
map('n', '<Leader>tj', neotest.run.run)
map('n', '<Leader>tt', neotest.run.run_last)
map('n', '<Leader>tu', neotest.run.stop)
map('n', '<Leader>to', neotest.output.open)
map('n', '<Leader>ts', M.toggle_summary)
map('n', '<Leader>dt', M.debug)

