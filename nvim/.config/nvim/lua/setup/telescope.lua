-- TELESCOPE SETUP

local f = require 'util.functions'
local map = f.map
local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'

telescope.setup {
  defaults = {
    prompt_prefix = ' ',
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

telescope.load_extension 'fzf'
telescope.load_extension 'file_browser'

M = {}

function M.current_buffer_fuzzy_find()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown())
end

function M.buffers()
  builtin.buffers {
    sort_lastused = true,
  }
end

function M.lsp_code_actions()
  builtin.lsp_code_actions(themes.get_cursor())
end

-- Keybindings
map('n', '<Leader><CR>', "<cmd>lua M.buffers()<CR>")                                        -- search buffers
map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>")            -- search files
map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>")             -- grep everywhere
map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>")             -- search help tags
map('n', '<Leader>fc', "<cmd>lua require('telescope.builtin').commands()<CR>")              -- search command history
map('n', '<Leader>/', "<cmd>lua M.current_buffer_fuzzy_find()<CR>")                         -- grep current buffer
map('n', '<Leader>:', "<cmd>lua require('telescope.builtin').command_history()<CR>")        -- search command history

-- LSP Keybindings
map('n', '<CR>', "<cmd>lua M.lsp_code_actions()<CR>")                                       -- show lsp code actions

