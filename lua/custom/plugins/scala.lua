return {
  {
    'scalameta/nvim-metals',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      {
        'mfussenegger/nvim-dap',
        optional = true,
        opts = function()
          -- Debug settings if you're using nvim-dap
          local dap = require 'dap'
          dap.configurations.scala = {
            {
              type = 'scala',
              request = 'launch',
              name = 'RunOrTest',
              metals = {
                runType = 'runOrTestFile',
                --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
              },
            },
            {
              type = 'scala',
              request = 'launch',
              name = 'Test Target',
              metals = {
                runType = 'testTarget',
              },
            },
          }
        end,
      },
    },
    ft = { 'scala', 'sbt', 'java' },
    opts = function()
      local metals_config = require('metals').bare_config()
      metals_config.settings = {
        showImplicitArguments = true,
      }
      metals_config.init_options.statusBarProvider = 'off'
      metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()
      metals_config.on_attach = function(client, bufnr)
        require('metals').setup_dap()

        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
        end

        map('<leader>mh', require('metals').hover_worksheet, 'Metals hover worksheet')
        map('<leader>mc', require('metals').compile_cascade, 'Metals compile cascade')
        map('<leader>me', require('telescope').extensions.metals.commands, 'Metals commands')
      end
      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = self.ft,
        callback = function()
          require('metals').initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
}
