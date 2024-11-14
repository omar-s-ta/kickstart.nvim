return {
  install = {
    colorscheme = {
      'kanagawa',
      'tokyonight',
      'nord',
    },
  },

  {
    'LazyVim/LazyVim',
    import = 'lazyvim.plugins',
    opts = {
      colorscheme = 'nord',
    },
  },

  -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth',
  },
}
