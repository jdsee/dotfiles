-- Sniprun Setup
-- https://github.com/michaelb/sniprun#configuration

local sniprun = require('sniprun')
local display = require('sniprun.display')
local map = require('util.functions').map

-- Keymappings
map('n', '<Leader>el', sniprun.run)
map('n', '<Leader>e', '<Plug>SnipRunOperator')
map('v', '<Leader>e', function() sniprun.run('v') end)
map('n', '<Leader>ex', sniprun.reset)
map('n', '<Leader>ed', display.close_all)
-- map('n', '<Leader>ee', '%<Plug>SnipRun<CR>', { silent = false })

