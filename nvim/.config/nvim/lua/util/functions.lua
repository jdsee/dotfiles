-- NVIM FUNCTIONS

local function extend_opt(lh, rh)
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
end

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  extend_opt(options, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function bmap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  extend_opt(options, opts)
  vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
end

return {
  map = map,
  bmap = bmap
}

