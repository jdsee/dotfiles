local mason = require 'mason'
local mason_lspconfig = require 'mason-lspconfig'
local lspconfig = require 'lspconfig'

mason.setup()
mason_lspconfig.setup {
  ensure_installed = {
    'angularls',
    'bashls',
    'clangd',
    'clojure_lsp',
    'cssls',
    'dockerls',
    'eslint',
    'grammarly-languageserver',
    'html',
    'pyright',
    'racket_langserver',
    'sumneko_lua',
    'texlab',
  },
}

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = require('jdsee.lsp.config').on_attach,
}

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults)

require('mason-lspconfig').setup_handlers {
  -- default setup
  function(server_name)
    require('lspconfig')[server_name].setup(lsp_defaults)
  end,

  ['sumneko_lua'] = require('jdsee.lsp.sumneko_lua').setup,
  ['hls'] = require('jdsee.lsp.hls').setup,
  ['jsonls'] = require('jdsee.lsp.jsonls').setup,
}

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local map = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.cmd [[ command! Format lua vim.lsp.buf.formatting()<CR> ]]

    -- Keybindings
    map('n', 'gD', vim.lsp.buf.declaration)
    map('n', 'gd', vim.lsp.buf.definition)
    map('n', 'gi', vim.lsp.buf.implementation)
    map('n', 'gt', vim.lsp.buf.type_definition)
    map('n', 'K', vim.lsp.buf.hover)
    map('n', '<C-K>', vim.lsp.buf.signature_help)
    map('n', '<leader>a', vim.lsp.buf.code_action)
    map('n', '<Leader>rr', vim.lsp.buf.rename)
    map('n', '<Leader>rf', vim.lsp.buf.formatting)
    map('n', '[d', vim.diagnostic.goto_prev)
    map('n', ']d', vim.diagnostic.goto_next)
  end
})

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
