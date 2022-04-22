-- FUGITIVE SETUP

local map = require('util.functions').map

map('n', '<Leader>gs', '<cmd>G<CR>')
map('n', 'd>', '<cmd>diffget //2<CR>')
map('n', 'd<', '<cmd>diffget //3<CR>')

