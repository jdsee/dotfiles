-- NVIM FUNCTIONS

local function extend_opt(lh, rh)
  if lh then
    return vim.tbl_extend("force", lh, rh)
  else
    return rh
  end
end

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  options = extend_opt(opts, options)
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function bmap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  options = extend_opt(opts, options)
  vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
end

return {
  map = map,
  bmap = bmap
}

