" =============================================================================
" $ cd
" $ rm .vimrc
" $ mc
"   select .vimrc from this repo, Ctrl + X, then S to have a symlink to it
"   You will update only the file in repo, restart vim and the news settings
"   will be available.
" =============================================================================


" Display line numbers on the left
set number

" Colored column 80 (79 chars per line)
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
