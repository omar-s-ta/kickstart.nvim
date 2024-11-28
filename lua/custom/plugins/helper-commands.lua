vim.api.nvim_create_user_command('TSInstalled', function()
  local treesitter_info = require 'nvim-treesitter.info'
  local installed_parsers = treesitter_info.installed_parsers()

  print('installed_parsers:\n' .. table.concat(installed_parsers, '\n'))
end, {})

return {}
