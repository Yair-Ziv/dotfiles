-- Color scheme
return {
  -- Theme inspired by Atom
  'rebelot/kanagawa.nvim',
  --'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    -- vim.cmd.colorscheme('onedark')
    vim.cmd.colorscheme('kanagawa')
  end,
}
