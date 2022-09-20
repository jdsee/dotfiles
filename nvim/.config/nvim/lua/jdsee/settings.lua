-- General
vim.o.syntax = 'on' -- basic syntax highlighting
vim.o.number = true -- line numbers
vim.o.relativenumber = true -- line number relative to position
vim.o.wrap = false -- don't wrap lines
vim.o.ignorecase = true -- case insensitive matching
vim.o.mouse = 'a' -- mouse support in all modes
vim.o.cursorline = true -- highlight current line
vim.o.scrolloff = 4 -- keep cursor away from vertical borders
vim.o.sidescrolloff = 4 -- keep cursor away from horizontal borders
-- vim.o.shortmess:append 'a'                -- use all message abbreveations
vim.opt.completeopt = { -- completion options
  'menu',
  'menuone',
  'noselect',
}

-- Tabs and Spaces
local indent = 2
vim.o.tabstop = indent
vim.o.softtabstop = indent
vim.o.shiftwidth = indent
vim.o.backspace = indent
vim.o.smarttab = true
vim.o.expandtab = true -- use spaces as tab
vim.o.smartindent = true -- auto indent on insert
vim.o.autoindent = true -- "
vim.opt.filetype.indent = true -- "
vim.o.splitright = true -- open new verticle splits on the right
vim.o.splitbelow = true -- open new horizontal splits on the bottom

-- Style
vim.cmd [[ colorscheme kanagawa ]] -- theme
vim.cmd [[ highlight Normal guibg=none]] -- make background transparent
vim.o.termguicolors = true -- true color support
vim.o.background = 'dark' -- dark bg
vim.o.hidden = true -- hide buffers without saving
vim.o.showmatch = true -- show matching brackets
vim.o.inccommand = 'nosplit' -- visualize command while typing
vim.o.hlsearch = false -- show no highlight on search
vim.o.cmdheight = 0 -- hide cmdline when not used
