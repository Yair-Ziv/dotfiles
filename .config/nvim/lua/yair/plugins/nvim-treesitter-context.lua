return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    require('treesitter-context').setup {
      enable = true,
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      mode = 'cursor'
    }
  end
}
