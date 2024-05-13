return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function ()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    local ufo = require('ufo')
    local kmap = vim.keymap
    kmap.set('n', 'zR', ufo.openAllFolds)
    kmap.set('n', 'zM', ufo.closeAllFolds)
    kmap.set('n', 'zk', function()
      require('ufo.preview'):peekFoldedLinesUnderCursor()
    end, { desc = 'Peek fold' })

    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end
    })
  end
}
