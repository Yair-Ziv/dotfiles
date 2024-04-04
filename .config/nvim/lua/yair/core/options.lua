vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Line numbering
opt.relativenumber = true
opt.number = true

-- Style
opt.cursorline = true
opt.background = "dark"

-- Tabs and Indentations
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Splitting
opt.splitright = true
opt.splitbelow = true

-- Fonts & Colors
opt.guifont = 'FiraCode Nerd Font Mono:h12'

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.mouse = "a"
opt.clipboard = 'unnamedplus'
--
-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

opt.termguicolors = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300
