-- | jdsee |
-- |-------------------------------------------------------------------------------
-- | NVIM SETTINGS
-- |-------------------------------------------------------------------------------

local g = vim.g
local o = vim.o
local wo = vim.wo
local opt = vim.opt
local opt_global = vim.opt_global
local cmd = vim.api.nvim_command

-- Leader: Space
vim.g.mapleader = ' '

-- General
opt.syntax = 'on'                     -- basic syntax highlighting
opt.number = true                     -- line numbers
opt.relativenumber = true             -- line number relative to position
opt.wrap = false                      -- don't wrap lines
opt.ignorecase = true                 -- case insensitive matching
-- opt.wildmode = { 'list', 'full' }     -- cli completion
opt.mouse = 'a'                       -- mouse support in all modes
wo.cursorline = true                  -- highlight current line
wo.scrolloff = 8                      -- keep cursor away from vertical borders
wo.sidescrolloff = 8                  -- keep cursor away from horizontal borders
opt_global.completeopt = {            -- completion options
  'menu',
  'noinsert',
  'noselect'
}

-- Tabs and Spaces
local indent = 2
opt.tabstop = indent
opt.softtabstop = indent
opt.shiftwidth = indent
opt.backspace = '2'
opt.smarttab = true
opt.expandtab = true                  -- use spaces as tab
opt.smartindent = true                -- auto indent on insert
opt.autoindent = true                 ---
opt.filetype.indent = true            ---
o.splitright = true                   -- open new verticle splits on the right
o.splitbelow = true                   -- open new horizontal splits on the bottom

-- View
opt.termguicolors = true              -- true color support
o.background = 'dark'
cmd [[ colorscheme gruvbox ]]         -- some gruv
cmd [[ highlight Normal guibg=none]]  -- make background transparent
opt_global.hidden = true              -- hide buffers without saving
opt_global.showmatch = true           -- show matching brackets
g.inccommand = 'nosplit'              -- visualize command while typing
o.hlsearch = false                    -- show no highlight on search

