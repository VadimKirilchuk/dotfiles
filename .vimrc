" ignore compatibility with old vi
" be iMproved required!
set nocompatible
filetype off

" Vundle! 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""""""" Vundle bundles """"""""
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'

Bundle 'kien/ctrlp.vim'
""""""""""""""""""""""""""""""""

" required!
filetype plugin indent on

" use system buffer always
set clipboard=unnamedplus

" set current dirrectory to recently opened buffer
autocmd BufEnter * lcd %:p:h

" open a NERDTree automatically when vim starts up if no files were specified
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" save undo history to external file
if version >= 730
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

colorscheme darkblue
syntax on

" show entered commands
set showcmd

""""""""" KEYS ADDITIONAL MAPPINGS """"""""""
let mapleader = ","

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""

" show line numbers
set number

" don't wrap lines by default
set nowrap

" expand all tabs to four spaces
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set autoindent
set hlsearch

" vim will leave 5 lines top and bottom of current line when scrolling
set scrolloff=5

" ruler at column
set colorcolumn=120

" aliases for next and previos buffer ctrl+n ctrl+p
" function! ChangeBuf(cmd)
"    if (&modified && &modifiable)
"        execute ":w"
"    endif
"    execute a:cmd
" endfunction
" nnoremap <silent> <C-o> :call ChangeBuf(":b#")<CR>
" nnoremap <silent> <C-n> :call ChangeBuf(":bn")<CR>
" nnoremap <silent> <C-p> :call ChangeBuf(":bp")<CR>

" Map ctrl-movement keys to window switching
" map <C-k> <C-w><Up>
" map <C-j> <C-w><Down>
" map <C-l> <C-w><Right>
" map <C-h> <C-w><Left>
