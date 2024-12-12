local M = {}

function M.print_tbl_elems_with_header(text, tbl)
  print(text .. ' (' .. #tbl .. ')\n' .. table.concat(tbl, '\n'))
end

function M.delegate_print(text, tbl)
  return function()
    M.print_tbl_elems_with_header(text, tbl)
  end
end

function M.installed_treesitter_parsers()
  return require('nvim-treesitter.info').installed_parsers()
end

function M.installed_lsp_servers()
  return require('lspconfig').util.available_servers()
end

function M.delete_marks()
  vim.cmd.delmarks 'a-z'
  vim.cmd.delmarks 'A-Z'
  vim.cmd.delmarks '0-9'
  vim.cmd.delmarks '^.[]'
  vim.cmd.delmarks '"'
  vim.cmd 'delmarks!'
end

function M.full_path_of_current_file()
  vim.fn.expand '%:p'
end

vim.api.nvim_create_user_command(
  'TSInstalled',
  M.delegate_print('installed_parsers:', M.installed_treesitter_parsers()),
  { desc = 'List installed treesitter parsers' }
)
vim.api.nvim_create_user_command('LSPInstalled', M.delegate_print('installed_lsps:', M.installed_lsp_servers()), { desc = 'List installed LSP servers' })
vim.api.nvim_create_user_command('DeleteMarks', M.delete_marks, { desc = 'Delete all marks across all buffers' })

return {}
