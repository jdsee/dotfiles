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
    use { 'tpope/vim-unimpaired' }                        -- convenient mappings like [<Space>
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
    use { 'scalameta/nvim-metals' }                       -- scala language support
    use { 'hrsh7th/nvim-cmp',                             -- lsp completion
          requires = {                                    ---
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/vim-vsnip' },
          },
        }
    use { 'nvim-telescope/telescope.nvim',                -- another fuzzy finder / TODO: delete
          requires = {                                    ---
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzy-native.nvim' }
          }
        }
  end
)


