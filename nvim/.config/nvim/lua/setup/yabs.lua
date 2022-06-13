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

    -- Scheme
    scheme = {
      tasks = {
        run = {
          command = "scheme --quiet < %",
          output = "echo",
        },
        interactive = {
          command = ":FloatermNew --name=repl scheme --interactive < %",
          output = "terminal",
          type = "vim",
        },
      },
    },

    -- Others
  },
}

-- Keymappings
map('n', '<Leader>ee', '<cmd>YabsTask run<CR>')
map('n', '<Leader>ei', '<cmd>YabsTask interactive<CR>')
