return {
  {
    'neovim-treesitter/nvim-treesitter',
    dependencies = {
      'neovim-treesitter/treesitter-parser-registry',
      'windwp/nvim-ts-autotag',
    },
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup({
        install_dir = vim.fn.stdpath('data') .. '/site',
      })

      require('nvim-treesitter').install({
        'bash', 'c', 'c_sharp', 'cpp', 'go', 'html', 'javascript',
        'lua', 'python', 'rust', 'tsx', 'typescript', 'vim', 'vimdoc',
      })

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })

      -- Incremental selection (built-in nvim 0.12)
      vim.keymap.set('x', '<C-Space>', 'an', { remap = true, desc = 'Expand treesitter selection' })
      vim.keymap.set('x', '<M-Space>', 'in', { remap = true, desc = 'Shrink treesitter selection' })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('nvim-treesitter-textobjects').setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      local ts_select = require('nvim-treesitter-textobjects.select')
      local ts_move = require('nvim-treesitter-textobjects.move')
      local ts_swap = require('nvim-treesitter-textobjects.swap')

      local function sel(query)
        return function() ts_select.select_textobject(query, 'textobjects') end
      end

      vim.keymap.set({ 'x', 'o' }, 'af', sel('@function.outer'), { desc = 'Around function' })
      vim.keymap.set({ 'x', 'o' }, 'if', sel('@function.inner'), { desc = 'Inside function' })
      vim.keymap.set({ 'x', 'o' }, 'ac', sel('@class.outer'), { desc = 'Around class' })
      vim.keymap.set({ 'x', 'o' }, 'ic', sel('@class.inner'), { desc = 'Inside class' })
      vim.keymap.set({ 'x', 'o' }, 'aa', sel('@parameter.outer'), { desc = 'Around parameter' })
      vim.keymap.set({ 'x', 'o' }, 'ia', sel('@parameter.inner'), { desc = 'Inside parameter' })

      local function move(query, dir)
        return function() ts_move['goto_' .. dir](query, 'textobjects') end
      end

      vim.keymap.set({ 'n', 'x', 'o' }, ']m', move('@function.outer', 'next_start'), { desc = 'Next function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']M', move('@function.outer', 'next_end'), { desc = 'Next function end' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']]', move('@class.outer', 'next_start'), { desc = 'Next class start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '][', move('@class.outer', 'next_end'), { desc = 'Next class end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[m', move('@function.outer', 'previous_start'), { desc = 'Prev function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[M', move('@function.outer', 'previous_end'), { desc = 'Prev function end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[[', move('@class.outer', 'previous_start'), { desc = 'Prev class start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[]', move('@class.outer', 'previous_end'), { desc = 'Prev class end' })

      vim.keymap.set('n', '<leader>a', function() ts_swap.swap_next('@parameter.inner') end, { desc = 'Swap next parameter' })
      vim.keymap.set('n', '<leader>A', function() ts_swap.swap_previous('@parameter.inner') end, { desc = 'Swap prev parameter' })
    end,
  },
}
