local M = {}

local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_terminal(opts)
  opts = opts or {}

  local ui = vim.api.nvim_list_uis()[1] -- Contains the current UI size
  local default_width = math.floor(ui.width * 0.75)
  local default_height = math.floor(ui.height * 0.75)
  local width = opts.width or default_width
  local height = opts.height or default_height
  local col = math.floor((ui.width - width) / 2)
  local row = math.floor((ui.height - height) / 2)

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- (listed=false, scratch=true)
  end

  local win_config = {
    relative = 'editor',
    style = 'minimal',
    row = row,
    col = col,
    width = width,
    height = height,
    border = 'rounded',
  }
  local win = vim.api.nvim_open_win(buf, true, win_config)
  return { buf = buf, win = win }
end

local toggle_term = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_terminal { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

-- vim.api.nvim_create_user_command('Floaterminal', toggle_term, {})
-- vim.keymap.set({ 'n', 't' }, '<space><space>t', toggle_term, { desc = 'Floating terminal' })

return M
