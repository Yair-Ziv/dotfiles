return {
  "mistricky/codesnap.nvim",
  build = "make",
  config = function()
    require("codesnap").setup({
      watermark = "",
      mac_window_bar = true,
      save_path = "~/Pictures/CodeSnap",
      bg_x_padding = 10,
      bg_y_padding = 10,
    })
  end,
}
