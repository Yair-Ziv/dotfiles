local M = {}

function M.setup()
  -- Focus gain and lose behaviours
  local function on_focus_lost()
    vim.opt.cursorline = false
    vim.opt.colorcolumn = "0"
    vim.opt.relativenumber = false
  end

  local function on_focus_gained()
    vim.opt.cursorline = true
    vim.opt.colorcolumn = "+0"
    vim.opt.relativenumber = true
  end

  vim.api.nvim_create_autocmd("FocusLost", {
    callback = on_focus_lost,
    desc = "Disable cursorline, colorcolumn, and relativenumber"
  })

  vim.api.nvim_create_autocmd("FocusGained", {
    callback = on_focus_gained,
    desc = "Enabled cursorline, colorcolumn, and relativenumber"
  })


  -- [[ Highlight on yank ]]
  -- See `:help vim.highlight.on_yank()`
  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  })

end

return M
