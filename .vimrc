" =============================================================================
" $ cd
" $ rm .vimrc
" $ mc
"   select .vimrc from this repo, Ctrl + X, then S to have a symlink to it
"   You will update only the file in repo, restart vim and the news settings
"   will be available.
"
" TODO:
" - column 80 better color
" - tabs vs spaces
" =============================================================================

" NeoBundle ===================================================================
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundle "sheerun/vim-polyglot"

call neobundle#end()
NeoBundleCheck
" End NeoBundle Scripts-------------------------

" Display line numbers on the left
set number

" Colored column 80 (79 chars per line)
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Colors schemes
" /usr/share/vim/vim74/colors$ ls
" blue.vim      default.vim  desert.vim   evening.vim   koehler.vim
" murphy.vim  peachpuff.vim  ron.vim    slate.vim  zellner.vim
" darkblue.vim  delek.vim    elflord.vim  industry.vim  morning.vim
" pablo.vim shine.vim  torte.vim
colorscheme default
syntax on

" Show wrong extra spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" by default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" for python, 4 spaces
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

" Python ======================================================================
" PDB
au FileType python map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>
