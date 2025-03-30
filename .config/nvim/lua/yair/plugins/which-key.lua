-- Gives key hints
return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {}, -- Use default options,
  config = function()
    local wk = require('which-key')

    -- document existing key chains
    wk.add {
      { "<leader>c", group = "[C]ode/loak" },
      { "<leader>d", group = "[D]ocument" },
      { "<leader>e", group = "[E]xplorer" },
      { "<leader>g", group = "[G]it" },
      { "<leader>h", group = "Git [H]unk" },
      { "<leader>k", group = "Cloa[K]" },
      { "<leader>f", group = "[F]ind" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>v", group = "[V]im" },
      { "<leader>vs", group = "[V]im [S]plit" },
      { "<leader>w", group = "[W]orkspace" },
    }

    -- register which-key VISUAL mode
    -- required for visual <leader>hs (hunk stage) to work
    wk.add({
      {
        mode = { "v" },
        { "<leader>", group = "VISUAL <leader>" },
        { "<leader>h", desc = "Git [H]unk" },
        { "<leader>sc", ":Silicon<CR>", desc = "Silicon Capture" },
      }
    })

    -- Git
    wk.add{
      { "<leader>gi", ":Git<CR>", desc = "Open [G]it [I]nteractive" },
    }

    -- Cloak
    wk.add {
      { "<leader>kd", ":CloakDisable<CR>", desc = "Cloak Disable" },
      { "<leader>ke", ":CloakEnable<CR>", desc = "Cloak Enable" },
      { "<leader>kp", ":CloakPreviewLine<CR>", desc = "Preview Cloak" },
      { "<leader>kt", ":CloakToggle<CR>", desc = "Toggle Cloak" },
    }

  end
}
