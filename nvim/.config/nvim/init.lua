-- | jdsee |
-- |-------------------------------------------------------------------------------
-- |  NEOVIM - INIT.LUA
-- |-------------------------------------------------------------------------------

require 'settings'
require 'plugins'
require 'keymaps'
require 'autocommands'

-- Plugin Setup
require 'setup.nvim-tree'
require 'setup.leaderf'
require 'setup.treesitter'
require 'setup.indent-line'
require 'setup.toggleterm'
require 'setup.lualine'
require 'setup.subversive'
require 'nvim-autopairs'.setup()
require 'Comment'.setup()
require 'colorizer'.setup()
require 'better_escape'.setup()
require 'toggleterm'.setup()

