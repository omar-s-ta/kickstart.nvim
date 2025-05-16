return {
  {
    'LazyVim/LazyVim',
    opts = {
      -- colorscheme = 'catppuccin',
      colorscheme = 'tokyonight',
    },
  },

  -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth',
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
