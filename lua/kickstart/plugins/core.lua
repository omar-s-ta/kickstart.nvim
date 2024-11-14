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
      colorscheme = 'kanagawa',
    },
  },

  -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth',
  },
}
