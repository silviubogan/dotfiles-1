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

" Python ======================================================================
" PDB
au FileType python map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>
