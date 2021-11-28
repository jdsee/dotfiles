-- | jdsee |
-- |-------------------------------------------------------------------------------
-- NVIM OPTIONS
-- |-------------------------------------------------------------------------------

local g = vim.g
local o = vim.o
local wo = vim.wo
local opt = vim.opt
local opt_global = vim.opt_global
local cmd = vim.api.nvim_command

-- General
opt.syntax = 'on'                   -- basic syntax highlighting
opt.number = true                   -- line numbers
opt.relativenumber = true           -- line number relative to position
opt.ignorecase = true               -- case insensitive matching
opt.termguicolors = true            -- true color support
opt.wildmode = {'list', 'longest'}  -- cli completion
wo.cursorline = true                -- highlight current line

-- Tabs and Spaces
local indent = 2
opt.tabstop = indent
opt.softtabstop = indent
opt.shiftwidth = indent
opt.backspace = '2'
opt.smarttab = true
opt.expandtab = true                -- use spaces as tab
opt.smartindent = true              -- auto indent on insert
opt.autoindent = true               -- auto indent

-- View
opt.termguicolors = true            -- true color support
opt_global.hidden = true            -- hide buffers without saving
opt_global.showmatch = true         -- show matching brackets
o.background = 'dark'
cmd('colorscheme gruvbox')
g.setinccommand = 'no-split'        -- visualize command while typing
