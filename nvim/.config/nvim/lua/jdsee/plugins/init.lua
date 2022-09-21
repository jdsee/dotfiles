local packer_bootstraped = require('jdsee.util.bootstrap').installPacker()

return require('packer').startup(
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }

    use 'tpope/vim-repeat' -- repeat plugin commands with .
    use 'tpope/vim-surround' -- work on surrounding characters like [({"'...
    use 'tpope/vim-fugitive' -- git integration
    use 'wellle/targets.vim' -- inner style text objects
    use 'dhruvasagar/vim-table-mode' -- markdown table support
    use 'bronson/vim-visual-star-search' -- use * and # in visual mode
    use 'ThePrimeagen/vim-be-good' -- game to practice vim movements

    --- Autopair Brackets ---
    use {
      'windwp/nvim-autopairs',
      config = function() require('nvim-autopairs').setup() end,
    }

    --- Comment out Code with gc[motion] ---
    use {
      'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end,
    }

    --- Visualize Colorcodes ---
    use {
      'norcalli/nvim-colorizer.lua',
      config = function() require('colorizer').setup() end,
    }

    --- Smooth Scrolling ---
    use {
      'karb94/neoscroll.nvim',
      config = function() require('neoscroll').setup() end,
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
        config = function() require('jdsee.plugins.nvim-treesitter') end,
        run = ':TSUpdate'
      },
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      { 'nvim-treesitter/nvim-treesitter-context' },
    }

    --- Refactoring Tool ---
    use {
      'ThePrimeagen/refactoring.nvim',
      config = function() require('jdsee.plugins.refactoring') end,
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-treesitter' }
      }
    }

    use {
      'ThePrimeagen/git-worktree.nvim',
      config = function() require('jdsee.plugins.git-worktree') end
    }

    use {
      'ThePrimeagen/harpoon',
      requires = 'nvim-lua/plenary.nvim',
      config = function() require('jdsee.plugins.harpoon') end
    }

    use {
      'pwntester/octo.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function() require('octo').setup() end
    }

    --- Nvim Build Tool ---
    use {
      'pianocomposer321/yabs.nvim',
      config = function() require('jdsee.plugins.yabs') end,
      requires = { 'nvim-lua/plenary.nvim' },
      disable = true,
    }

    --- Code Runner ---
    use {
      'michaelb/sniprun',
      config = function() require('jdsee.plugins.sniprun') end,
      run = 'bash ./install.sh',
      disable = true,
    }

    --- GIT Marker ---
    use {
      'lewis6991/gitsigns.nvim',
      config = function() require('jdsee.plugins.gitsigns') end,
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
      { 'catppuccin/catppuccin' },
      { 'rose-pine/neovim' },
      { 'Yagua/nebulous.nvim' },
      use {
        'mcchrish/zenbones.nvim',
        requires = 'rktjmp/lush.nvim'
      }
    }

    --- File Tree ---
    use {
      'nvim-neo-tree/neo-tree.nvim',
      config = function() require('jdsee.plugins.neotree') end,
      branch = "v2.x",
      requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
      },
    }

    --- Indentation Visualizer ---
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function() require('jdsee.plugins.indent-blankline') end,
    }

    --- Statusbar ---
    use {
      'nvim-lualine/lualine.nvim',
      config = function() require('jdsee.plugins.lualine') end,
    }

    --- Telescope Fuzzy Finder ---
    use {
      {
        'nvim-telescope/telescope.nvim',
        config = function() require('jdsee.plugins.telescope') end,
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
      { 'nvim-telescope/telescope-ui-select.nvim' },
    }

    --- LSP ---
    use {
      'neovim/nvim-lspconfig',
      requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'onsails/lspkind-nvim',
      },
      config = function() require('jdsee.lsp') end,
    }

    --- LSP Completion ---
    use {
      'hrsh7th/nvim-cmp',
      config = function() require('jdsee.plugins.nvim-cmp') end,
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

    --- Latex Integration ---
    use {
      'lervag/vimtex',
      config = function() require('jdsee.plugins.vimtex') end
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
      config = function() require('jdsee.plugins.neotest') end
    }

    use {
      'mfussenegger/nvim-dap',
      config = function() require('jdsee.plugins.nvim-dap') end,
      requires = {
        { 'nvim-telescope/telescope-dap.nvim' },
        { 'theHamsta/nvim-dap-virtual-text' },
        { 'rcarriga/nvim-dap-ui' },
        { 'jbyuki/one-small-step-for-vimkind' },
        { 'mfussenegger/nvim-dap-python' },
      }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstraped then
      require('packer').sync()
    end

  end)
