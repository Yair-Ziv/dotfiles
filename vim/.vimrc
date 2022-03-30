:set tabstop=4
:set shiftwidth=4
:set expandtab
:set autoindent
:set smartindent
:set encoding=utf-8
:set wrap
:set visualbell
:set title
:set confirm
:set number relativenumber
:set nu rnu
:set nonumber norelativenumber
:set nonu nornu
:set nu! rnu!
:set hls
:set ruler
:set nocp

" TEST

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

map <F6> :setlocal spell! spelllang=en_us<CR>
