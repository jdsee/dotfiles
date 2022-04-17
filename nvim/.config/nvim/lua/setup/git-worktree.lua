-- Git Worktree
--- https://github.com/ThePrimeagen/git-worktree.nvim#getting-started

local map = require('util.functions').map
local telescope = require("telescope")

telescope.load_extension("git_worktree")

map('n', '<Leader>gw', telescope.extensions.git_worktree.git_worktrees)

