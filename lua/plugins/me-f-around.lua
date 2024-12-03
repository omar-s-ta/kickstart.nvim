local function print_table_with_text(text, tbl)
  print(text .. ' (' .. #tbl .. ')\n' .. table.concat(tbl, '\n'))
end

vim.api.nvim_create_user_command('TSInstalled', function()
  local treesitter_info = require 'nvim-treesitter.info'
  local installed_parsers = treesitter_info.installed_parsers()

  print_table_with_text('installed_parsers:', installed_parsers)
end, {})

vim.api.nvim_create_user_command('LSPInstalled', function()
  local lspconfig = require 'lspconfig'
  local servers = lspconfig.util.available_servers()

  print_table_with_text('installed_lsps:', servers)
end, {})

vim.api.nvim_create_user_command('DeleteAllMarks', function()
  vim.cmd.delmarks 'a-z'
  vim.cmd.delmarks 'A-Z'
  vim.cmd.delmarks '0-9'
  vim.cmd.delmarks '^.[]'
  vim.cmd.delmarks '"'
  vim.cmd 'delmarks!'
end, { desc = 'Delete all marks across all buffers' })

return {}
