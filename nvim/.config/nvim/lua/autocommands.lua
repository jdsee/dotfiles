-- NVIM AUTOCOMMANDS

-- Open help in vertical split
vim.cmd [[
  au FileType help wincmd L
]]

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Terminal Defaults
vim.cmd [[
  augroup Terminal
      au!
      au TermEnter * startinsert                     "" start terminal in insert mode
      au TermOpen * :set nonumber norelativenumber   "" disable linenumbers in terminal
      au TermOpen * nnoremap <buffer> <C-c> i<C-c>   "" use Ctrl-c in terminal
  augroup END
]]

-- Set wrap for markdown files
vim.cmd [[
  augroup MarkdownWrap
    au!
    au BufEnter *.md setlocal wrap
  augroup END
]]

-- Set mappings only for quickfix windows
vim.cmd [[
  augroup QuickFix
    au FileType qf <buffer> nnoremap o <CMD>.cc<CR>
    au FileType qf <buffer> nnoremap <CR> <CMD>.cc<CR>
  augroup END
]]


