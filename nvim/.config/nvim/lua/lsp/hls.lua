-- HASKELL LSP SETUP

local M = {}

function M.setup(on_attach)
  require('lspconfig').hls.setup({
    on_attach = on_attach,
    root_dir = vim.loop.cwd,
    settings = {
      haskell = {
        hlintOn = true,
        formattingProvider = "fourmolu"
      }
    }
  })
end

return M

