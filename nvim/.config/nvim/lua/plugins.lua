-- | jdsee |
-- |-------------------------------------------------------------------------------
-- |   NEOVIM - PLUGINS
-- |-------------------------------------------------------------------------------

require('util.bootstrap').installPacker()

return require('packer').startup(
function(use)
  use { 'wbthomason/packer.nvim', opt = true }

  use 'tpope/vim-repeat'                            -- repeat plugin commands with .
  use 'tpope/vim-surround'                          -- work on surrounding characters like [({"'...
  use 'tpope/vim-fugitive'                          -- git integration
  use 'wellle/targets.vim'                          -- inner style text objects
  use 'dhruvasagar/vim-table-mode'                  -- markdown table support
  use 'bronson/vim-visual-star-search'              -- use * and # in visual mode
  use 'ThePrimeagen/vim-be-good'                    -- game to practice vim movements

  --- Autopair Brackets ---
  use {
    'windwp/nvim-autopairs',
    config = [[ require('nvim-autopairs').setup() ]],
  }

  use {
    'sindrets/diffview.nvim',
    config = [[ require('setup.diffview') ]],
    requires = 'nvim-lua/plenary.nvim'
  }

  --- Comment out Code with gc[motion] ---
  use {
    'numToStr/Comment.nvim',
    config = [[ require('Comment').setup() ]],
  }

  --- Visualize Colorcodes ---
  use {
    'norcalli/nvim-colorizer.lua',
    config = [[ require('colorizer').setup() ]],
  }

  --- Smooth Scrolling ---
  use {
    'karb94/neoscroll.nvim',
    config = [[ require('neoscroll').setup() ]],
  }

  --- Markdown Browser Preview ---
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    cmd = 'MarkdownPreview'
  }

  --- Treesitter: Better Syntax Highlighting ---
  use {
    {
      'nvim-treesitter/nvim-treesitter',
      config = [[ require('setup.nvim-treesitter') ]],
      run = ':TSUpdate'
    },
    { 'nvim-treesitter/nvim-treesitter-textobjects' }
  }

  --- Refactoring Tool ---
  use {
    'ThePrimeagen/refactoring.nvim',
    config = [[ require('setup.refactoring') ]],
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter' }
    }
  }

  use {
    'ThePrimeagen/git-worktree.nvim',
    config = [[ require('setup.git-worktree')]]
  }

  use {
    'ThePrimeagen/harpoon',
    requires = 'nvim-lua/plenary.nvim',
    config = [[ require('setup.harpoon') ]]
  }

  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = [[ require('octo').setup() ]]
  }

  --- Nvim Build Tool ---
  use {
    'pianocomposer321/yabs.nvim',
    config = [[ require('setup.yabs') ]],
    requires = { 'nvim-lua/plenary.nvim' }
  }

  --- Code Runner ---
  use {
    'michaelb/sniprun',
    config = [[ require('setup.sniprun') ]],
    run = 'bash ./install.sh',
  }

  --- GIT Marker ---
  use {
    'lewis6991/gitsigns.nvim',
    config = [[ require('setup.gitsigns') ]],
    requires = { 'nvim-lua/plenary.nvim' }
  }

  --- Tab View for Buffers ---
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  --- Colorschemes ---
  use {
    { 'ellisonleao/gruvbox.nvim' },
    { 'sainnhe/gruvbox-material' },
    { 'sainnhe/everforest' },
    { 'Mofiqul/adwaita.nvim' },
    { 'rebelot/kanagawa.nvim' },
    { 'folke/tokyonight.nvim' },
    { 'shaunsingh/nord.nvim' },
    { 'EdenEast/nightfox.nvim' },
  }

  --- File Tree ---
  use {
    'nvim-neo-tree/neo-tree.nvim',
    config = [[ require('setup.neotree') ]],
    branch = "v2.x",
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
  }

  --- Improved terminal support ---
  use {
    'voldikss/vim-floaterm',
    config = [[ require('setup.vim-floaterm') ]],
  }

  --- Indentation Visualizer ---
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = [[ require('setup.indent-blankline') ]],
  }

  --- Statusbar ---
  use {
    'nvim-lualine/lualine.nvim',
    config = [[ require('setup.lualine') ]],
  }

  --- Substitute with s[motion], ---
  -- TODO: remove if not needed
  use {
    'svermeulen/vim-subversive',
    config = [[ require('setup.vim-subversive') ]],
    disable = true,
  }

  --- Telescope Fuzzy Finder ---
  use {
    {
      'nvim-telescope/telescope.nvim',
      config = [[ require('setup.telescope') ]],
      requires = {
        'nvim-lua/plenary.nvim',
        'telescope-fzf-native.nvim',
        'telescope-frecency.nvim',
        'telescope-file-browser.nvim',
      },
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sqlite.lua',
    },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    {'nvim-telescope/telescope-ui-select.nvim' },
  }

  --- Native LSP configuration ---
  use {
    { 'williamboman/nvim-lsp-installer' },
    { 'neovim/nvim-lspconfig',
      config = [[ require('setup.lsp.nvim-lspconfig') ]],
    },
    { 'onsails/lspkind-nvim' },
  }

  --- LSP Completion ---
  use {
    'hrsh7th/nvim-cmp',
    config = [[ require('setup.nvim-cmp') ]],
    requires = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip' },
    }
  }

  --- Snippets ---
  use {
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
  }

  --- Scala LSP ---
  use {
    'scalameta/nvim-metals',
    requires = { "nvim-lua/plenary.nvim" }
  }

  --- Latex LSP ---
  use {
    'lervag/vimtex',
    config = [[ require('setup.vimtex') ]]
  }

  --- Clojure Integration ---
  use { 'Olical/conjure' }

  --- Better Error Support for Haskell ---
  use {
    'ndmitchell/ghcid',
    rtp = 'plugins/nvim'
  }

  --- Testrunner ---
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'vim-test/vim-test',
      'nvim-neotest/neotest-python',
      'nvim-neotest/neotest-plenary',
      'nvim-neotest/neotest-vim-test',
    },
    config = [[ require('setup.neotest') ]]
  }

  use {
    'mfussenegger/nvim-dap',
    config = [[ require('setup.nvim-dap') ]],
    requires = {
      { 'nvim-telescope/telescope-dap.nvim' },
      { 'theHamsta/nvim-dap-virtual-text' },
      { 'rcarriga/nvim-dap-ui' },
      { 'jbyuki/one-small-step-for-vimkind' },
      { 'mfussenegger/nvim-dap-python' },
    }
  }


end)

