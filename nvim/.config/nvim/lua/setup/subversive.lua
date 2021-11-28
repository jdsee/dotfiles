-- SUBVERSIVE SETUP

local cmd = vim.api.nvim_command
local f = require 'util.functions'
local map = f.map

-- TODO: find lua solution for <plug>
cmd([[
  nmap s <plug>(SubversiveSubstitute)
  nmap ss <plug>(SubversiveSubstituteLine)
  map S <plug>(SubversiveSubstituteToEndOfLine)

  nmap <Leader>s <plug>(SubversiveSubstituteRange)
  xmap <Leader>s <plug>(SubversiveSubstituteRange)
  nmap <Leader>ss <plug>(SubversiveSubstituteWordRange)

  xmap s <plug>(SubversiveSubstitute)
  xmap p <plug>(SubversiveSubstitute)
  xmap P <plug>(SubversiveSubstitute)
]])

map('o', 'a', ':exec "normal! ggVG"<CR>')     -- whole buffer text object
map('n', '<C-G>', '<Leader>ccwa')             -- refactor word in buffer
map('x', '<C-G>', '<Leader>ccwa')             -- refactor word in buffer

