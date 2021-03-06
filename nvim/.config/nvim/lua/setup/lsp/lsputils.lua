-- LSPUTILS
--

vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

--local codeAction = require 'lsputil.codeAction'
--local locations = require 'lsputil.locations'
--local symbols = require 'lsputil.symbols'
--
--if vim.fn.has('nvim-0.5.1') == 1 then
--  vim.lsp.handlers['textDocument/codeAction'] = codeAction.code_action_handler
--  vim.lsp.handlers['textDocument/references'] = locations.references_handler
--  vim.lsp.handlers['textDocument/definition'] = locations.definition_handler
--  vim.lsp.handlers['textDocument/declaration'] = locations.declaration_handler
--  vim.lsp.handlers['textDocument/typeDefinition'] = locations.typeDefinition_handler
--  vim.lsp.handlers['textDocument/implementation'] = locations.implementation_handler
--  vim.lsp.handlers['textDocument/documentSymbol'] = symbols.document_handler
--  vim.lsp.handlers['workspace/symbol'] = symbols.workspace_handler
--else
--  local bufnr = vim.api.nvim_buf_get_number(0)
--
--  vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
--    codeAction.code_action_handler(nil, actions, nil, nil, nil)
--  end
--
--  vim.lsp.handlers['textDocument/references'] = function(_, _, result)
--    locations.references_handler(nil, result, { bufnr = bufnr }, nil)
--  end
--
--  vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
--    locations.definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
--  end
--
--  vim.lsp.handlers['textDocument/declaration'] = function(_, method, result)
--    locations.declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
--  end
--
--  vim.lsp.handlers['textDocument/typeDefinition'] = function(_, method, result)
--    locations.typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
--  end
--
--  vim.lsp.handlers['textDocument/implementation'] = function(_, method, result)
--    locations.implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
--  end
--
--  vim.lsp.handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
--    symbols.document_handler(nil, result, { bufnr = bufn }, nil)
--  end
--
--  vim.lsp.handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
--    symbols.workspace_handler(nil, result, { bufnr = bufn }, nil)
--  end
--end
--
