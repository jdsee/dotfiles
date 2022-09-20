-- TELESCOPE SETUP

local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'

telescope.setup {
  defaults = {
    prompt_prefix = ' ',
    defaults = {},
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-J>"] = "move_selection_next",
        ["<C-K>"] = "move_selection_previous",
      }
    },
  },
  pickers = {},
  extensions = {}
}

telescope.load_extension 'fzf'
telescope.load_extension 'file_browser'
telescope.load_extension 'harpoon'
telescope.load_extension 'ui-select'

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

function M.lsp_find_references()
  builtin.lsp_references(themes.get_cursor())
end

function M.find_all_files()
  builtin.find_files {
    hidden = true,
    follow = true,
  }
end

function M.find_nvim_files()
  builtin.find_files {
    opt = { cwd = "$XDG_HOME/neovim" },
    hidden = true }
end

-- Keybindings
vim.keymap.set('n', '<Leader><CR>', M.buffers)                  -- search buffers
vim.keymap.set('n', '<Leader>ff', M.find_all_files)             -- search files
vim.keymap.set('n', '<Leader>fn', M.find_nvim_files)            -- search files in neovim config
vim.keymap.set('n', '<Leader>fg', builtin.live_grep)            -- grep everywhere
vim.keymap.set('n', '<Leader>fh', builtin.help_tags)            -- search help tags
vim.keymap.set('n', '<Leader>gb', builtin.git_branches)         -- search git branches
vim.keymap.set('n', '<Leader>fc', builtin.commands)             -- search command history
vim.keymap.set('n', '<Leader>/', M.current_buffer_fuzzy_find)   -- grep current buffer
vim.keymap.set('n', '<Leader>:', builtin.command_history)       -- search command history
vim.keymap.set('n', '<Leader>fd', builtin.diagnostics)          -- search errors from lsp
vim.keymap.set('n', '<Leader-a>', M.lsp_code_actions)           -- search code actions in telescope
vim.keymap.set('n', 'gr', M.lsp_find_references)                -- find references with lsp
