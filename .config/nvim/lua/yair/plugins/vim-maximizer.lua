-- Maximizes a pane in vim
return {
  "szw/vim-maximizer",
  keys = {
    { "<leader>vm", ":MaximizerToggle<CR>", desc = "Maximize/minimize a split" }
  }
}
