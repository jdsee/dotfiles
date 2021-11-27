-- LEADERF SETUP

local f = require 'util.functions'
local map = f.map
local g = vim.g

-- Settings
g.Lf_ShortcutF = '<Leader><Leader>'
g.Lf_WindowPosition = 'popup'
g.Lf_PreviewInPopup = 1

vim.api.nvim_exec(
  [[
    let g:Lf_CommandMap = {
    \  '<C-V>' : ['<C-S-V>'],
    \  '<C-]>' : ['<C-V>']
    \}
  ]], false)

-- Keybindings
map('n', '<Leader><CR>', ':LeaderfBuffer<CR>')                                          -- search buffers
map('n', '<Leader>m', ':LeaderfMru<CR>')                                                -- search mru files
map('n', '<Leader>g', ':Leaderf rg -S<CR>')                                             -- grep everywhere
map('n', '<Leader>f', ':Leaderf rg -S --current-buffer<CR>')                            -- grep current buffer
map('n', '<Leader>h', ':LeaderfHelp<CR>')                                               -- grep current buffer
map('x', 'gf', ':<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>')  -- go to file under cursor

