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
    'jsonls',
    'lemminx',
    'marksman',
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

-- Autoformat on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.js', '*.jsx', '*.lua' },
  callback = vim.lsp.buf.format,
})
