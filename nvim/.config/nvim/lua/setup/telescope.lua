-- TELESCOPE SETUP

local f = require 'util.functions'
local map = f.map
local telescope = require 'telescope'
local actions = require 'telescope.actions'
local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'

telescope.setup {
  defaults = {
    prompt_prefix = '$ ',
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["C-J"] = "move_selection_next",
        ["C-K"] = "move_selection_previous",
      }
    }
  },
  pickers = {},
  extensions = {}
}

telescope.load_extension('fzf')

function Current_buffer_fuzzy_find()
    builtin.current_buffer_fuzzy_find(themes.get_ivy())
    print('WORKING')
end

-- Keybindings
map('n', '<Leader><Space>', "<cmd>lua require('telescope.builtin').find_files()<CR>")       -- search files
map('n', '<Leader><CR>', "<cmd>lua require('telescope.builtin'). buffers()<CR>")            -- search buffers
map('n', '<Leader>g', "<cmd>lua require('telescope.builtin').live_grep()<CR>")              -- grep everywhere
map('n', '<Leader>f', "<cmd>lua require('telescope.builtin').file_browser()<CR>")           -- search buffers
map('n', '<Leader>;', "<cmd>lua require('telescope.builtin').command_history()<CR>")        -- search command history
map('n', '<Leader>h', "<cmd>lua require('telescope.builtin').help_tags()<CR>")              -- grep current buffer
map('n', '<Leader>/', "<cmd>lua Current_buffer_fuzzy_find()<CR>")                           -- grep current buffer

