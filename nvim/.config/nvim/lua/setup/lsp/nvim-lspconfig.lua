-- NVIM LSPCONFIG

local map = require('util.functions').map

require("nvim-lsp-installer").setup()

local on_attach = function()
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { buffer = true }
  map('n', 'gD', vim.lsp.buf.declaration, opts)
  map('n', 'gd', vim.lsp.buf.definition, opts)
  map('n', 'gi', vim.lsp.buf.implementation, opts)
  map('n', 'gt', vim.lsp.buf.type_definition, opts)
  map('n', 'gr', vim.lsp.buf.references, opts)
  map('n', 'K', vim.lsp.buf.hover, opts)
  map('n', '<C-K>', vim.lsp.buf.signature_help, opts)
  map('n', '<Leader>rr', vim.lsp.buf.rename, opts)
  map('n', '<Leader>rf', vim.lsp.buf.formatting, opts)
  map('n', '<Leader>e', vim.diagnostic.open_float, opts)
  map('n', '[d', vim.diagnostic.goto_prev, opts)
  map('n', ']d', vim.diagnostic.goto_next, opts)
  vim.cmd [[ command! Format lua vim.lsp.buf.formatting()<CR> ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Automatic language server setup
local auto_setup_servers = {
  'pyright',
  'bashls',
  'clangd',
  'dockerls',
  'eslint',
  'cssls',
  'html',
  'angularls',
  'racket_langserver',
  'texlab',
}

local nvim_lsp = require 'lspconfig'

for _, server in ipairs(auto_setup_servers) do
  nvim_lsp[server].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Manual language server setup
local manual_setup_servers = {
  'setup.lsp.jsonls',
  'setup.lsp.sumneko-lua',
  'setup.lsp.metals',
  'setup.lsp.hls'
}

for _, server in ipairs(manual_setup_servers) do
  require(server).setup(on_attach)
end


-- Autoformat on save
local autocmd = vim.api.nvim_create_autocmd
local formatting_sync = function()
  vim.lsp.buf.formatting_sync(nil, 100)
end

autocmd(
  'BufWritePre', {
    pattern = { '*.js', '*.jsx', '*.lua' },
    callback = formatting_sync,
  })

