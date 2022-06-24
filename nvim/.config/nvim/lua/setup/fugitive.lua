-- FUGITIVE SETUP

local map = require('util.functions').map

map('n', '<Leader>gs', '<cmd>G<CR>')
map('n', 'gd>', '<cmd>diffget //2<CR>')
map('n', 'gd<', '<cmd>diffget //3<CR>')
map('n', 'gdl', '<cmd>diffget //2<CR>')
map('n', 'gdh', '<cmd>diffget //3<CR>')

