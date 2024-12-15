-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

--  Vim convenience keymaps
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down half page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up half page' })
vim.keymap.set('n', '<leader>se', '/', { desc = 'Search current file' })
vim.keymap.set('n', 'gg', 'gg0', { desc = 'Move to the first position in current file' })
vim.keymap.set('n', 'G', 'G$', { desc = 'Move to the last position in the current file' })

--  Resize window using <ctrl><shift> arrow keys
--  Overrides default keymaps
vim.keymap.set('n', '<C-S-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
vim.keymap.set('n', '<C-S-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
vim.keymap.set('n', '<C-S-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
vim.keymap.set('n', '<C-S-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

--  Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Quickfix keymaps
-- Overrides default keymaps
vim.keymap.set('n', '<S-j>', vim.cmd.cnext, { desc = 'Next Quickfix' })
vim.keymap.set('n', '<S-k>', vim.cmd.cprev, { desc = 'Previous Quickfix' })

--  Lua convenience keymaps
vim.keymap.set('n', '<space><space>x', '<cmd>source %<CR>', { desc = 'Source current file' })
vim.keymap.set('n', '<space>x', ':.lua<CR>', { desc = 'Run current lua code' })
vim.keymap.set('v', '<space>x', ':lua<CR>', { desc = 'Run highlighted lua codes' })

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
