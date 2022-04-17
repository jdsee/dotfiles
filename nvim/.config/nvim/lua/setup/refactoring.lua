-- REFACTORING.NVIM
---- https://github.com/ThePrimeagen/refactoring.nvim#configuration

local map = require('util.functions').map
local refactoring = require 'refactoring'
local telescope = require 'telescope'

refactoring.setup()
telescope.load_extension('refactoring')

local M = {}

function M.extract_function()
  refactoring.refactor('Extract Function')
end

function M.extract_function_to_file()
  refactoring.refactor('Extract Function To File')
end

function M.inline_variable()
  refactoring.refactor('Inline Variable')
end

function M.debug_print()
  refactoring.debug.printf { below = false }
end

map('v', '<Leader>re', M.extract_function)
map('v', '<Leader>ref', M.extract_function_to_file)
map('v', '<Leader>ri', M.inline_variable)

map( 'n', '<Leader>rp', M.debug_print)

map("v", "<Leader>rv",refactoring.debug.print_var)
map("n", "<Leader>rc",refactoring.debug.cleanup)

-- Telescope extension
map( "v", "<Leader>rm", telescope.extensions.refactoring.refactors)

