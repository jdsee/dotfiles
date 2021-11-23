-- NVIM AUTOCOMMANDS

local cmd = vim.api.nvim_command

cmd([[
  autocmd FileType help wincmd L    " open help in vertical split
]])

