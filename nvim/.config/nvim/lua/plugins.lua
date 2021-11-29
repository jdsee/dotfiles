-- | jdsee |
-- |-------------------------------------------------------------------------------
-- |   NEOVIM - PLUGINS
-- |-------------------------------------------------------------------------------

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function()
    use { 'wbthomason/packer.nvim', opt = true }
    use { 'windwp/nvim-autopairs' }                       -- autopair brackets, etc.
    use { 'max397574/better-escape.nvim' }                -- escape with jj or jk
    use { 'norcalli/nvim-colorizer.lua' }                 -- visualize color-codes
    use { 'numToStr/Comment.nvim' }                       -- comment with gcc
    use { 'tpope/vim-repeat' }                            -- repeat plugin commands with .
    use { 'nvim-lualine/lualine.nvim' }                   -- status line
    use { 'tpope/vim-surround' }                          -- work on surrounding characters like [({"'...
    use { 'akinsho/toggleterm.nvim'}                      -- better inbuild terminal
    use { 'nvim-treesitter/nvim-treesitter' }             -- better syntax highlighting
    use { 'svermeulen/vim-subversive' }                   -- substitute with s[motion]
    use { 'romgrk/barbar.nvim',                           -- show buffers in tabs
          requires = {'kyazdani42/nvim-web-devicons'}     ---
        }
    use { 'ellisonleao/gruvbox.nvim',                     -- gruvbox <3
          requires = { 'rktjmp/lush.nvim' }               ---
        }
    use { 'lukas-reineke/indent-blankline.nvim' }         -- indentation visualisation
    use { 'bronson/vim-visual-star-search' }              -- use * and # in visual mode
    use { 'Yggdroot/LeaderF',                             -- fuzzy finder
          run = { ':LeaderfInstallCExtension' }             -- c extension for performance boost
        }
    use { 'kyazdani42/nvim-tree.lua',                     -- file explorer
          requires = 'kyazdani42/nvim-web-devicons'       ---
        }
    use { 'neovim/nvim-lspconfig' }                       -- basic language support
    use { "nvim-lua/plenary.nvim" }                       -- plenary
    use { "scalameta/nvim-metals",                        -- scala language support
          requires = { "nvim-lua/plenary.nvim" }          ---
        }
    use { 'onsails/lspkind-nvim' }                        -- icons in completion list
    use { 'RishabhRD/nvim-lsputils',                      -- default settings for lsp
          requires = { 'RishabhRD/popfix' }               ---
        }
    use { 'L3MON4D3/LuaSnip' }                            -- luasnip
    use { 'rafamadriz/friendly-snippets' }                -- some general snippets for luasnip
    use { 'hrsh7th/nvim-cmp',                             -- lsp completion
          requires = {                                    ---
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'saadparwaiz1/cmp_luasnip' },
          },
        }
  end
)

