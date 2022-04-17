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
map('n', '<Leader><CR>', M.buffers)                   -- search buffers
map('n', '<Leader>ff', builtin.find_files)            -- search files
map('n', '<Leader>fg', builtin.live_grep)             -- grep everywhere
map('n', '<Leader>fh', builtin.help_tags)             -- search help tags
map('n', '<Leader>gb', builtin.git_branches)          -- search git branches
map('n', '<Leader>fc', builtin.commands)              -- search command history
map('n', '<Leader>/', M.current_buffer_fuzzy_find)    -- grep current buffer
map('n', '<Leader>:', builtin.command_history)        -- search command history
map('n', '<CR>', M.lsp_code_actions)                  -- search code actions in telescope
map('n', '<Leader>fd', builtin.diagnostics)           -- search errors from lsp
