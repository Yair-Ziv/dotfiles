return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', 'gl', ':Git pull<CR>', { desc = 'Git Pull' })
    vim.keymap.set('n', 'gp', ':Git push<CR>', { desc = 'Git Push' })
  end,
}
