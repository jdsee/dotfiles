-- | jdsee |
-- |-------------------------------------------------------------------------------
-- |  NEOVIM - INIT.LUA
-- |-------------------------------------------------------------------------------

require 'settings'
require 'plugins'
require 'keymap'
require 'autocommands'

-- Plugin Setup
require 'setup.nvim-tree'
require 'setup.telescope'
require 'setup.treesitter'
require 'setup.indent-line'
require 'setup.toggleterm'
require 'setup.lualine'
require 'setup.subversive'
require 'setup.nvim-cmp'
require 'setup.nvim-lspconfig'
require 'setup.vim-kitty-navigator'
require 'gitsigns'.setup()
require 'nvim-autopairs'.setup()
require 'zen-mode'.setup()
require 'Comment'.setup()
require 'colorizer'.setup()
require 'better_escape'.setup()
require 'toggleterm'.setup()
require 'neoscroll'.setup()

