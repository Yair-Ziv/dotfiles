return {
  "ggandor/leap.nvim",
  config = function()
    local kmap = vim.keymap

    kmap.set('n', '<leader>f', '<Plug>(leap)', { desc = 'Leap in file' })
    kmap.set('n', '<leader>F', '<Plug>(leap-from-window)', { desc = 'Leap in file' })
  end
}
