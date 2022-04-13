-- YABS.NVIM
--- https://github.com/pianocomposer321/yabs.nvim#setup

local map = require('util.functions').map

require("yabs"):setup {
  languages = {

    -- Lua
    lua = {
      tasks = {
        run = {
          command = "luafile %",
          type = "lua",
        },
      },
    },

    -- Python
    python = {
      tasks = {
        run = {
          command = "python %",
          output = "echo",
        },
        interactive = {
          command = ":FloatermNew --name=repl ptpython -i %",
          output = "terminal",
          type = "vim",
        },
      },
    },

    -- Others
  },
}

-- Keymappings
map('n', '<Leader>rr', '<cmd>YabsTask run<CR>')
map('n', '<Leader>ri', '<cmd>YabsTask interactive<CR>')
