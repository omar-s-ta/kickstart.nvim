return {
  {
    'L3MON4D3/LuaSnip',
    lazy = true,
    build = (function()
      if vim.fn.has 'win32' or not vim.fn.executable 'make' then
        return
      end
      return 'make install_jsregexp'
    end)(),
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function(_, opts)
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = 'TextChanged',
    },
    config = function(_, opts)
      local luasnip = require 'luasnip'
      LazyVim.cmp.actions.snippet_forward = function()
        if luasnip.jumpable(1) then
          luasnip.jump(1)
          return true
        end
      end
    end,
  },
}
