return {
  {
    -- See `:help gitsigns` to understand what the configuration keys do
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    opts = {
      servers = {
        eslint = {},
        bashls = {
          filetypes = { 'sh', 'zsh' },
        },
        metals = {
          keys = {
            { 'gS', '<cmd>MetalsGotoSuperMethod<CR>', desc = 'Goto Super' },
          },
        },
      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { 'utf-16' }
        end,
        eslint = function()
          require('lazyvim.util').lsp.on_attach(function(client)
            if client.name == 'eslint' then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == 'tsserver' then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },

  {
    'folke/edgy.nvim',
    opts = function(_, opts)
      opts.keys = vim.tbl_extend('force', opts.keys or {}, {
        ['<c-Right>'] = nil,
        ['<c-Left>'] = nil,
        ['<c-Up>'] = nil,
        ['<c-Down>'] = nil,

        -- increase width
        ['<C-S-Right>'] = function(win)
          win:resize('width', 2)
        end,
        -- decrease width
        ['<C-S-Left>'] = function(win)
          win:resize('width', -2)
        end,
        -- increase height
        ['<C-S-Up>'] = function(win)
          win:resize('height', 2)
        end,
        -- decrease height
        ['<C-S-Down>'] = function(win)
          win:resize('height', -2)
        end,
      })
    end,
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  },

  {
    'echasnovski/mini.files',
    opts = {
      windows = { preview = false },
    },
    keys = {
      {
        '\\',
        function()
          require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = 'Open mini.files (Directory of Current File)',
      },
      {
        '<leader>\\',
        function()
          require('mini.files').open(vim.uv.cwd(), true)
        end,
        desc = 'Open mini.files (cwd)',
      },
    },
  },

  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
}
