local function print_table_with_text(text, tbl)
  print(text .. '\n' .. table.concat(tbl, '\n'))
end

vim.api.nvim_create_user_command('TSInstalled', function()
  local treesitter_info = require 'nvim-treesitter.info'
  local installed_parsers = treesitter_info.installed_parsers()

  print_table_with_text('installed_parsers:', installed_parsers)
end, {})

vim.api.nvim_create_user_command('MasonInstalled', function()
  local mason_registry = require 'mason-registry'
  local installed_packages = mason_registry.get_installed_package_names()

  print_table_with_text('installed_packages:', installed_packages)
end, {})

return {}
