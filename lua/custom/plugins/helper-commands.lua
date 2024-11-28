local function print_table_with_text(text, tbl)
  print(text .. ' (' .. #tbl .. ')\n' .. table.concat(tbl, '\n'))
end

vim.api.nvim_create_user_command('TSInstalled', function()
  local treesitter_info = require 'nvim-treesitter.info'
  local installed_parsers = treesitter_info.installed_parsers()

  print_table_with_text('installed_parsers:', installed_parsers)
end, {})

return {}
