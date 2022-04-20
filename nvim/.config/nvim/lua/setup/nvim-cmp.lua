-- NVIM-CMP SETUP

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.shortmess:append "c"

local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

lspkind.init()

local confirm_mapping = cmp.mapping.confirm {
  behavior = cmp.ConfirmBehavior.Replace,
  select = true,
}


cmp.setup {
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = confirm_mapping,
    ['<C-Space>'] = confirm_mapping,
  },
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'treesitter' },
    { name = 'buffer', keywowrd_length = 5 },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = '[buf]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[api]',
        path = '[path]',
        luasnip = '[snip]',
        gh_issues = '[issues]',
      }
    }
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  }
}

local function has_words_before()
  local cursor = vim.api.nvim_win_get_cursor(0)
  return (vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], true)[1] or ''):sub(cursor[2], cursor[2]):match('%s')
end

local tab_mapping = cmp.mapping(
  function(fallback)
    if cmp.visible() then cmp.select_next_item()
    elseif has_words_before() then cmp.complete()
    else fallback() end
  end, {"i", "c"})

local tab_back_mapping = cmp.mapping(
  function(fallback)
    if cmp.visible() then cmp.select_prev_item()
    else fallback() end
  end, {"i", "c"})

-- completion for search
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer'}
  },
  mappings = {
    ['<Tab>'] = tab_mapping,
    ['<S-Tab>'] = tab_back_mapping,
  }
})

-- completion for command line
cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline'}
  },
  mappings = {
    ['<Tab>'] = tab_mapping,
    ['<S-Tab>'] = tab_back_mapping,
  }
})

-- TODO: set color

