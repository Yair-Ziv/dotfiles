-- Color scheme
return {
  -- Theme inspired by Atom
  'folke/tokyonight.nvim',
  --'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    -- vim.cmd.colorscheme('onedark')
    vim.cmd.colorscheme('tokyonight')
  end,
}
