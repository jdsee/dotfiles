-- | jdsee |
-- |-------------------------------------------------------------------------------
-- |   NEOVIM - PLUGINS
-- |-------------------------------------------------------------------------------

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

return require('packer').startup(
  function(use)
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
    use { 'nvim-treesitter/nvim-treesitter-textobjects' } -- syntax aware text objects
    use { 'wellle/targets.vim' }                          -- inner style text objects
    use { 'svermeulen/vim-subversive' }                   -- substitute with s[motion]
    use { 'karb94/neoscroll.nvim' }                       -- smooth scrolling
    use { 'folke/zen-mode.nvim' }                         -- distraction free zen mode
    use { 'dhruvasagar/vim-table-mode' }                  -- markdown table support
    use { 'lukas-reineke/indent-blankline.nvim' }         -- indentation visualisation
    use { 'bronson/vim-visual-star-search' }              -- use * and # in visual mode
    use { 'ggandor/lightspeed.nvim' }                     -- motions to move around quickly
    use { 'tpope/vim-fugitive' }                          -- git support
    use { 'ThePrimeagen/vim-be-good'}                     -- game to practice vim movements
    use { 'lewis6991/gitsigns.nvim',                      -- show git changes and more
          requires = { 'nvim-lua/plenary.nvim' }          ---
        }
    use { 'romgrk/barbar.nvim',                           -- show buffers in tabs
          requires = { 'kyazdani42/nvim-web-devicons' }   ---
        }
    use { 'ellisonleao/gruvbox.nvim',                     -- gruvbox <3
          requires = { 'rktjmp/lush.nvim' }               ---
        }
    use {'nvim-telescope/telescope-fzf-native.nvim',      -- Telecope c port for speed and better scoring
          run = 'make'
        }
    use { 'nvim-telescope/telescope.nvim',                -- Telescope fuzzy finder
          requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'kyazdani42/nvim-tree.lua',                     -- file explorer
          requires = 'kyazdani42/nvim-web-devicons'       ---
        }
    use { 'neovim/nvim-lspconfig' }                       -- basic language support
    use { 'onsails/lspkind-nvim' }                        -- icons in completion list
    use {  'ndmitchell/ghcid',                            -- haskell fast error support
          rtp = 'plugins/nvim'                            ---
        }
    use { "scalameta/nvim-metals",                        -- scala language support
          requires = { "nvim-lua/plenary.nvim" }          ---
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

