-- Harpoon Setup

local map = require('util.functions').map
Mark = require('harpoon.mark')
Ui = require('harpoon.ui')

map('n', '<C-h>', Ui.nav_prev)
map('n', '<C-l>', Ui.nav_next)
map('n', '<Leader>hh', Ui.toggle_quick_menu)
map('n', '<Leader>ha', Mark.add_file)
map('n', '<Leader>hr', Mark.rm_file)
map('n', '<Leader>hf', Mark.toggle_file)

