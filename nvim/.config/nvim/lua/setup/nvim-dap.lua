-- Setup nvim-dap
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local dap, dapui = require('dap'), require('dapui')
local map = require('util.functions').map

require('telescope').load_extension('dap')
require('dap-python').setup('~/.pyenv/versions/debugpy/bin/python')
require('nvim-dap-virtual-text').setup()
dapui.setup()

-- open/close UI on dap events
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- customize signs
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })

Fn = {}
function Fn.set_conditional_breakpoint()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end
function Fn.set_log_point()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end

-- Keymappings --
map('n', '<Leader>bb', dap.toggle_breakpoint)
map('n', '<Leader>b?', Fn.set_conditional_breakpoint)
map('n', '<Leader>bl', Fn.set_log_point)
map('n', '<Leader>bd', dap.clear_breakpoints)

map('n', '<A-j>', dap.step_over)
map('n', '<A-k>', dap.step_out)
map('n', '<A-h>', dap.step_back)
map('n', '<A-l>', dap.step_into)

map('n', '<Leader>dn', dap.continue)
map('n', '<Leader>dd', dap.run_last)
map('n', '<Leader>ds', dap.terminate)
map('n', '<Leader>d>', dap.run_to_cursor)
map('n', '<Leader>di', dap.repl.toggle)

map('n', '<Leader>dk', dap.up)
map('n', '<Leader>dj', dap.down)

map('n', '<Leader>dt', dapui.toggle)
-- map('n', '<Leader>dv', dapui.float_element('scopes', {}))

-- Lua setup
dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host, port = config.port })
end
dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
    host = function()
      local value = vim.fn.input('Host [127.0.0.1]: ')
      if value ~= "" then
        return value
      end
      return '127.0.0.1'
    end,
    port = function()
      local val = tonumber(vim.fn.input('Port: '))
      assert(val, "Please provide a port number")
      return val
    end,
  }
}

