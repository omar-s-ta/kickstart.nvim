-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '

-- Overrides ~/.local/share/nvim/lazy/LazyVim/lua/config/options.lua
vim.g.maplocalleader = ' '

-- vim.g.lazyvim_picker = 'snacks'
-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = 'pyright'
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = 'ruff'

-- vim.o.tabstop = 2
-- vim.o.shiftwidth = 2
-- vim.o.softtabstop = 2
-- vim.o.expandtab = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
-- vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
-- vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--
-- Overrides ~/.local/share/nvim/lazy/LazyVim/lua/config/options.lua
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
-- vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true

-- Keep signcolumn on by default
-- vim.opt.signcolumn = 'yes'

vim.opt.softtabstop = 2

-- Overrides ~/.local/share/nvim/lazy/LazyVim/lua/config/options.lua
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
--
-- Overrides ~/.local/share/nvim/lazy/LazyVim/lua/config/options.lua
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'split'

-- Show which line your cursor is on
-- vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- Overrides ~/.local/share/nvim/lazy/LazyVim/lua/config/options.lua
vim.opt.scrolloff = 15

vim.api.nvim_create_user_command('OptionsCheck', function()
  print 'options.lua'
end, {})
