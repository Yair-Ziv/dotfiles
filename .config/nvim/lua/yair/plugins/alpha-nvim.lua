return {
  'goolord/alpha-nvim',
  config = function ()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    local icons = require('yair.utils.icons').icons
    local header = require('yair.utils.alpha-headers')

    dashboard.section.header.val = header

    dashboard.section.buttons.val = {
      dashboard.button( 'e', icons.kinds.new.File .. 'New file' , ':enew<CR>' ),
      dashboard.button( 'o', icons.kinds.new.FindFIle .. 'Find file', ':Telescope oldfiles<CR>' ),
      dashboard.button( '<SPC> e e', icons.ui.open_folder .. 'Open file explorer'),
      dashboard.button( 'l', icons.kinds.custom_icons.Lazy .. 'Open Lazy', ':Lazy<CR>'),
      dashboard.button( 'q', icons.ui.buffer_close .. 'Close NVIM', ':qa<CR>')
    }
    alpha.setup(dashboard.config)
  end
};
