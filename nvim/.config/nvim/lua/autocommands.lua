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

-- Terminal Defaults
vim.cmd [[
  augroup neovim_terminal
      autocmd!
      autocmd TermOpen * startinsert                      "" start terminal in insert mode
      autocmd TermOpen * :set nonumber norelativenumber   "" disable linenumbers in terminal
      autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>   "" use Ctrl-c in terminal
  augroup END
]]
