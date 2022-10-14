local npairs = require 'nvim-autopairs'
-- TODO: this is broken
-- local Rule = require 'nvim-autopairs.rule'
-- local cond = require 'nvim-autopairs.conds'

npairs.setup {
  disable_filetype = { 'TelescopePrompt' },
}

-- npairs.add_rules(
--   Rule('$$', '$$', 'tex')
--   Rule("'", "'", 'clojure'):with_pair(cond.none())
-- )
