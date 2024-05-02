
local kmap = vim.keymap

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Unset space defaults to allow space as default
kmap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
kmap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
kmap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
kmap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
kmap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
kmap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- Window management
kmap.set('n', '<leader>vsv', '<C-w>v', { desc = 'Split window vertically' })
kmap.set('n', '<leader>vsh', '<C-w>s', { desc = 'Split window horizontally' })

-- Exit insert mode with jj instead of Escape
-- Funnily enough, it was hard to type that comment
-- cause it kept going back to normal mode and deleting the jj (it happened again)
kmap.set('i', 'jj', '<Esc>')
