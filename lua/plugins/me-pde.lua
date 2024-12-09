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
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    keys = {
      {
        '<leader>sA',
        '<cmd>Telescope aerial<cr>',
        desc = 'Goto Symbol (Aerial)',
      },
      {
        '<leader>ss',
        function()
          require('telescope.builtin').lsp_document_symbols {
            symbols = LazyVim.config.get_kind_filter(),
          }
        end,
        desc = 'Goto Symbol',
      },
    },
  },

  { 'Bilal2453/luvit-meta', lazy = true },
  {
    'folke/lazydev.nvim',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        { path = 'LazyVim', words = { 'LazyVim' } },
        { path = 'snacks.nvim', words = { 'Snacks' } },
        { path = 'lazy.nvim', words = { 'LazyVim' } },
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'hrsh7th/cmp-nvim-lsp',
    },
    opts = {
      servers = {
        eslint = {},
        bashls = {
          filetypes = { 'sh', 'zsh' },
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
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-emoji' },
    opts = function(_, opts)
      table.insert(opts.sources, { name = 'emoji' })
      opts.experimental.ghost_text = false -- disable ghost_text
      opts.mapping = vim.tbl_extend('force', opts.mapping or {}, {
        ['<CR>'] = nil, -- Disable the <CR> keymap
      })
    end,
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
    'cuducos/yaml.nvim',
    ft = { 'yaml' }, -- optional
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
    },
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
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
