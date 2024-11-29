return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = '<M-]>',
          prev = '<M-[>',
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
    config = function(_, opts)
      require('copilot').setup(opts)
      LazyVim.cmp.actions.ai_accept = function()
        if require('copilot.suggestion').is_visible() then
          LazyVim.create_undo()
          require('copilot.suggestion').accept()
          return true
        end
      end
    end,
  },

  {
    'zbirenbaum/copilot-cmp',
    enabled = vim.g.ai_cmp, -- only enable if wanted
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require 'copilot_cmp'
      copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      LazyVim.lsp.on_attach(function()
        copilot_cmp._on_insert_enter {}
      end, 'copilot')
    end,
  },
}
