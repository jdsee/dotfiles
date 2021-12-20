-- TELESCOPE SETUP

local f = require 'util.functions'
local map = f.map
local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'

telescope.setup {
  defaults = {
    prompt_prefix = '$ ',
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-J>"] = "move_selection_next",
        ["<C-K>"] = "move_selection_previous",
      }
    }
  },
  pickers = {},
  extensions = {}
}

telescope.load_extension('fzf')

M = {}

function M.current_buffer_fuzzy_find()
  local opts = themes.get_dropdown { }
  builtin.current_buffer_fuzzy_find(opts)
end

function M.buffers()
  builtin.buffers {
    sort_lastused = true,
  }
end

-- Keybindings
map('n', '<Leader><Space>', "<cmd>lua require('telescope.builtin').find_files()<CR>")       -- search files
map('n', '<Leader><CR>', "<cmd>lua M.buffers()<CR>")                                        -- search buffers
map('n', '<Leader>b', "<cmd>lua M.current_buffer_fuzzy_find()<CR>")                         -- grep current buffer
map('n', '<Leader>g', "<cmd>lua require('telescope.builtin').live_grep()<CR>")              -- grep everywhere
-- map('n', '<Leader>f', "<cmd>lua require('telescope.builtin').file_browser()<CR>")           -- file browser
map('n', '<Leader>h', "<cmd>lua require('telescope.builtin').help_tags()<CR>")              -- search help tags
map('n', '<Leader>;', "<cmd>lua require('telescope.builtin').command_history()<CR>")        -- search command history

