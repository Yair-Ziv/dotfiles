-- Handles todo comments, not yet working
-- HACK This is a warning
-- TODO: This is an example for todo
-- TEST this is an example for test
-- FIXME This is an example for fixme
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false }
}
