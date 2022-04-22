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
  use 'wellle/targets.vim'                          -- inner style text objects
  use 'dhruvasagar/vim-table-mode'                  -- markdown table support
  use 'bronson/vim-visual-star-search'              -- use * and # in visual mode
  use 'ggandor/lightspeed.nvim'                     -- motions to move around quickly
  use 'ThePrimeagen/vim-be-good'                    -- game to practice vim movements
  use 'onsails/lspkind-nvim'                        -- icons in completion list

  --- Autopair Brackets ---
  use {
    'windwp/nvim-autopairs',
    config = [[ require('nvim-autopairs').setup() ]],
  }

  --- Fugitive GIT integration
  use {
    'tpope/vim-fugitive',
    disable = false,
  }

  --- GIT Difftool ---
  use {
    'sindrets/diffview.nvim',
    config = [[ require('setup.diffview') ]],
    requires = 'nvim-lua/plenary.nvim'
  }

  --- GIT integration ---
  -- TODO: decide between neogit and fugitive
  use {
    'TimUntersberger/neogit',
    disable = true,
    -- config = [[ require('setup.neogit') ]],
    requires = 'nvim-lua/plenary.nvim'
  }

  --- Distraction Free Zen Mode ---
  use {
    'folke/zen-mode.nvim',
    config = [[ require('zen-mode').setup() ]],
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

  --- Nvim Build Tool ---
  use {
    'pianocomposer321/yabs.nvim',
    config = [[ require('setup.yabs') ]],
    requires = { 'nvim-lua/plenary.nvim' }
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
    { 'Mofiqul/adwaita.nvim' },
    { 'rebelot/kanagawa.nvim' },
    { 'folke/tokyonight.nvim' },
  }

  --- File Tree ---
  use {
    'kyazdani42/nvim-tree.lua',
    config = [[ require('setup.nvim-tree') ]],
    requires = 'kyazdani42/nvim-web-devicons'
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
  }

  --- Native LSP configuration ---
  use {
    'neovim/nvim-lspconfig',
    config = [[ require('setup.nvim-lspconfig') ]],
  }

  --- Scala LSP ---
  use {
    'scalameta/nvim-metals',
    requires = { "nvim-lua/plenary.nvim" }
  }

  --- Snippets ---
  use {
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
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

  --- Better Error Support for Haskell ---
  use {
    'ndmitchell/ghcid',
    rtp = 'plugins/nvim'
  }

  --- Testrunner ---
  use {
    'rcarriga/vim-ultest',
    requires = { 'vim-test/vim-test' },
    run = ':UpdateRemotePlugins'
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

