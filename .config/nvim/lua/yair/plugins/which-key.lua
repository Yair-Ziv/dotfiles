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
    wk.register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>e'] = { name = '[E]xplorer', _ = 'which_key_ignore'},
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
      ['<leader>v'] = { name = '[V]im', _ = 'which_key_ignore'},
      ['<leader>vs'] = { name = '[V]im [S]plit', _ = 'which_key_ignore'},
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    }

    -- register which-key VISUAL mode
    -- required for visual <leader>hs (hunk stage) to work
    wk.register({
      ['<leader>'] = { name = 'VISUAL <leader>' },
      ['<leader>h'] = { 'Git [H]unk' },
      ['<leader>sc'] = { ":Silicon<CR>", "Silicon Capture" },
    }, { mode = 'v' })

    -- Git
    wk.register{
      ['<leader>gi'] = { ":Git<CR>", "Open [G]it [I]nteractive" },
    }
  end
}
