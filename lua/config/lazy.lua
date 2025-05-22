-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
--
require('lazy').setup {
  spec = {
    -- add LazyVim and import its plugins
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },

    -- edgy must be imported before aerial
    { import = 'lazyvim.plugins.extras.ui.edgy' },

    -- { import = 'lazyvim.plugins.extras.ai.copilot' },
    -- { import = 'lazyvim.plugins.extras.ai.copilot-chat' },

    { import = 'lazyvim.plugins.extras.coding.luasnip' },
    { import = 'lazyvim.plugins.extras.coding.mini-surround' },
    { import = 'lazyvim.plugins.extras.coding.neogen' },
    { import = 'lazyvim.plugins.extras.coding.yanky' },

    { import = 'lazyvim.plugins.extras.dap.core' },
    { import = 'lazyvim.plugins.extras.dap.nlua' },

    { import = 'lazyvim.plugins.extras.editor.aerial' },
    { import = 'lazyvim.plugins.extras.editor.dial' },
    { import = 'lazyvim.plugins.extras.editor.inc-rename' },
    { import = 'lazyvim.plugins.extras.editor.mini-files' },
    { import = 'lazyvim.plugins.extras.editor.refactoring' },
    { import = 'lazyvim.plugins.extras.editor.snacks_explorer' },
    { import = 'lazyvim.plugins.extras.editor.snacks_picker' },

    { import = 'lazyvim.plugins.extras.formatting.prettier' },

    { import = 'lazyvim.plugins.extras.lang.clojure' },
    { import = 'lazyvim.plugins.extras.lang.clangd' },
    { import = 'lazyvim.plugins.extras.lang.cmake' },
    { import = 'lazyvim.plugins.extras.lang.docker' },
    { import = 'lazyvim.plugins.extras.lang.git' },
    { import = 'lazyvim.plugins.extras.lang.go' },
    { import = 'lazyvim.plugins.extras.lang.helm' },
    { import = 'lazyvim.plugins.extras.lang.java' },
    { import = 'lazyvim.plugins.extras.lang.json' },
    { import = 'lazyvim.plugins.extras.lang.kotlin' },
    { import = 'lazyvim.plugins.extras.lang.markdown' },
    { import = 'lazyvim.plugins.extras.lang.nix' },
    { import = 'lazyvim.plugins.extras.lang.ocaml' },
    { import = 'lazyvim.plugins.extras.lang.python' },
    { import = 'lazyvim.plugins.extras.lang.rust' },
    { import = 'lazyvim.plugins.extras.lang.scala' },
    { import = 'lazyvim.plugins.extras.lang.sql' },
    { import = 'lazyvim.plugins.extras.lang.terraform' },
    { import = 'lazyvim.plugins.extras.lang.toml' },
    { import = 'lazyvim.plugins.extras.lang.typescript' },
    { import = 'lazyvim.plugins.extras.lang.yaml' },
    { import = 'lazyvim.plugins.extras.lang.zig' },

    { import = 'lazyvim.plugins.extras.linting.eslint' },

    { import = 'lazyvim.plugins.extras.test.core' },

    { import = 'lazyvim.plugins.extras.ui.treesitter-context' },

    { import = 'lazyvim.plugins.extras.util.dot' },
    { import = 'lazyvim.plugins.extras.util.gitui' },
    { import = 'lazyvim.plugins.extras.util.rest' },

    -- import/override with your plugins
    { import = 'plugins' },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { 'tokyonight', 'habamax' } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
