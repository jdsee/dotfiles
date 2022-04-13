-- REFACTORING.NVIM
---- https://github.com/ThePrimeagen/refactoring.nvim#configuration

local map = require('util.functions').map

require('refactoring').setup()
require('telescope').load_extension('refactoring')

-- Remaps for each of the four debug operations currently offered by the plugin
map('v', '<Leader>ef', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR> ]])
map('v', '<Leader><Leader>ef', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR> ]])
map('v', '<Leader>iv', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR> ]])
map('v', '<Leader>ri', [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]])

map(
	'n',
	'<leader>rp',
	":lua require('refactoring').debug.printf({below = false})<CR>"
)

map("v", "<leader>rv", ":lua require('refactoring').debug.print_var({})<CR>")
map("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>")

-- Telescope extension

map(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>"
)

