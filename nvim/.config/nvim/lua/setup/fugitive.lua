-- FUGITIVE SETUP

local map = require('util.functions').map

map('n', '<Leader>gs', '<cmd>G<CR>')

map('n', '<Leader>gh', '<cmd>diffget //2')
map('n', '<Leader>gh', '<cmd>diffget //3')
