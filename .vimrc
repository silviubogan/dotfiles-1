" =============================================================================
" $ cd
" $ rm .vimrc
" $ mc
"   select .vimrc from this repo, Ctrl + X, then S to have a symlink to it
"   You will update only the file in repo, restart vim and the new settings
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

NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "sheerun/vim-polyglot"

NeoBundle 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

NeoBundle 'Vimjas/vim-python-pep8-indent'
NeoBundle "mattn/emmet-vim.git"
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

NeoBundle "Shougo/neocomplcache.vim"

let g:neocomplcache_enable_at_startup = 1

NeoBundle "garbas/vim-snipmate"
NeoBundle "honza/vim-snippets"

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
