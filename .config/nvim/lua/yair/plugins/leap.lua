return {
  "ggandor/leap.nvim",
  config = function()
    local kmap = vim.keymap

    kmap.set('n', 's', '<Plug>(leap)', { desc = 'Leap in file' })
    kmap.set('n', 'S', '<Plug>(leap-from-window)', { desc = 'Leap in file' })
  end
}
