-- JOSN LSP SETUP

local M = {}

function M.setup(on_attach)
  require'lspconfig'.jsonls.setup {
    on_attach = on_attach,
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
  }
end

return M

