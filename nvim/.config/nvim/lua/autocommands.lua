-- NVIM AUTOCOMMANDS

local cmd = vim.api.nvim_command

-- Open help in vertical split
cmd [[
  autocmd FileType help wincmd L
]]

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

