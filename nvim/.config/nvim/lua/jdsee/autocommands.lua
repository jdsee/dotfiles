-- NVIM AUTOCOMMANDS

-- Open help in vertical split
vim.cmd [[
  au FileType help wincmd L
]]

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    au!
    au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 100 }
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

-- Set wrap for text files
vim.cmd [[
  augroup MarkdownWrap
    au!
    au BufEnter *.md,*.tex setlocal wrap spell
  augroup END
]]

-- Set mappings only for quickfix windows
-- TODO: make this work
-- vim.cmd [[
--   augroup QuickFix
--     au FileType qf <buffer> nnoremap o <CMD>.cc<CR>
--     au FileType qf <buffer> nnoremap <CR> <CMD>.cc<CR>
--   augroup END
-- ]]

-- Prevent creation of insecure copies of gopass files
vim.cmd [[
  au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
]]

-- Call PackerSync when plugins changed
vim.api.nvim_create_autocmd(
  'BufWritePost', {
    pattern = 'lua/plugins.lua',
    command = 'PackerSync',
})
