return {
  'krivahtoo/silicon.nvim',
  run = './install.sh build',
  config = function()
    require('silicon').setup({
      output = {
        clipboard = true,
      },
      font = 'FiraCode Nerd Font Mono',
      theme = 'Dracula',
      background = '#8877ff',
      shadow = {
        blur_radius = 2
      },
      watermark = {
        text = ' @Yair-Ziv'
      }
    })
  end
}
