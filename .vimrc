" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" ignore compatibility with old vi
" be iMproved required!
set nocompatible

" Turn off filetype plugins before bundles init
filetype off

" Vundle! 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""""""" General vim options """"""""""""
" Auto reload changed files
set autoread

" Indicates fast terminal connection
set ttyfast

" Set character encoding to use in vim
set encoding=utf-8

" Let vim know what encoding we use in our terminal
set termencoding=utf-8

" Enable Indent in plugins
filetype plugin indent on

" use system buffer always
" set clipboard=unnamedplus

" save undo history to external file
if version >= 730
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" Colorscheme
set t_Co=256
colorscheme darkblue

" Syntax highlighting
syntax on

" show entered commands
set showcmd

" Show file name in window title
set title

" show line numbers
set number

" don't wrap lines by default
set nowrap

" expand all tabs to four spaces
set expandtab

" number of spaces to use for each step of indent
set shiftwidth=4

" Same but for editing operation (not shure what exactly does it means)
" but in most cases tabstop and softtabstop better be the same
set softtabstop=4

" Number of spaces that a Tab in the file counts for
set tabstop=4

" Copy indent from previous line
set autoindent
" Enable smart indent. it add additional indents whe necessary
set smartindent

" Round indent to multiple of 'shiftwidth'.
" Indentation always be multiple of shiftwidth
" Applies to  < and > command
set shiftround

" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" vim will leave 5 lines top and bottom of current line when scrolling
set scrolloff=5

" Numbers of columns to keep to the left and to the right off the screen
set sidescrolloff=10

" ruler at column
set colorcolumn=120
highlight ColorColumn ctermbg=red

" Setting up right-hand section(ruller) format
set rulerformat=%30(%=\:%y%m%r%w\ %l,%c%V\ %P%)

" The cursor should stay where you leave it, instead of moving to the first non
" blank of the line
set nostartofline

" Highlight line with cursor
set cursorline

" Show matching brackets
set showmatch

" Make < and > match as well
set matchpairs+=<:>

" Extended autocmpletion for commands
set wildmenu

" Autocmpletion hotkey
set wildcharm=<TAB>

" Disable backups file
set nobackup

" Disable vim common sequense for saving.
" By defalut vim write buffer to a new file, then delete original file
" then rename the new file.
set nowritebackup

" Disable swp files
set noswapfile

" Do not add eol at the end of file.
set noeol

" Diff Options
" Display filler
set diffopt=filler
" Open diff in horizontal buffer
set diffopt+=horizontal
" Ignore changes in whitespaces characters
set diffopt+=iwhite


""""""""""""""""""""""""""""""""""""""

"""""""" Vundle bundles """"""""""""""
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'
" Browsing filesystem in tree-like manner
Bundle 'scrooloose/nerdtree'
" ?
Bundle 'scrooloose/nerdcommenter'
" Fast file searching by ctrl+p hotkey 
Bundle 'kien/ctrlp.vim'
" Git support from Vim
Bundle 'tpope/vim-fugitive'
" Fancy status bar which is more informative and customizable than standard
Bundle 'bling/vim-airline'
" Allow autoclose paired characters like [,] or (,)
Bundle 'Raimondi/delimitMate'
"""""""""" Bundles configuration """""""
" NERDTree configuration
" set current dirrectory to recently opened buffer
" !!!WARNING!!! THIS BREAKS SEVERAL FUGUTIVE.vim COMMANDS!!! 
" autocmd BufEnter * lcd %:p:h

" open a NERDTree automatically when vim starts up if no files were specified
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""""""""""""""""""""""""""""""""""""""""""
" Airline configuration 
let g:airline_theme='dark'

let g:airline_enable_fugitive=1

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
""""""""""""""""""""""""""""""""""""""""""""
" DelimitMate configuration
" Setup pair characters
let delimitMate_matchpairs = '(:),[:],{:}'

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1
"""""""""""""""""""""""""""""""""""""""""""

""""""""" KEYS ADDITIONAL MAPPINGS """"""""""
let mapleader = ","

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" Disable higlighting search result on Enter key
nnoremap <silent> <cr> :nohlsearch<cr><cr>
"""""""""""""""""""""""""""""""""""""""""""""


" aliases for next and previos buffer ctrl+n ctrl+p (CONFLICTS with ctrlP
" bundle!!!)
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
