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


  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.setpos(".", save_cursor)
    end,
  })
end

return M
