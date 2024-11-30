return {
  {
    'LazyVim/LazyVim',
    import = 'lazyvim.plugins',
    opts = {
      colorscheme = 'catppuccin',
    },
  },

  { import = 'lazyvim.plugins.extras.ai.copilot-chat' },
  { import = 'lazyvim.plugins.extras.coding.yanky' },
  { import = 'lazyvim.plugins.extras.editor.mini-files' },
  { import = 'lazyvim.plugins.extras.formatting.prettier' },

  { import = 'lazyvim.plugins.extras.lang.clangd' },
  { import = 'lazyvim.plugins.extras.lang.cmake' },
  { import = 'lazyvim.plugins.extras.lang.docker' },
  { import = 'lazyvim.plugins.extras.lang.git' },
  { import = 'lazyvim.plugins.extras.lang.helm' },
  { import = 'lazyvim.plugins.extras.lang.java' },
  { import = 'lazyvim.plugins.extras.lang.json' },
  { import = 'lazyvim.plugins.extras.lang.kotlin' },
  { import = 'lazyvim.plugins.extras.lang.markdown' },
  { import = 'lazyvim.plugins.extras.lang.rust' },
  { import = 'lazyvim.plugins.extras.lang.scala' },
  { import = 'lazyvim.plugins.extras.lang.terraform' },
  { import = 'lazyvim.plugins.extras.lang.toml' },
  { import = 'lazyvim.plugins.extras.lang.yaml' },
  { import = 'lazyvim.plugins.extras.linting.eslint' },
  { import = 'lazyvim.plugins.extras.ui.treesitter-context' },
  { import = 'lazyvim.plugins.extras.util.dot' },

  -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth',
  },
}
