set number
" new
set smartindent
set mouse=a
map k gk
map j gj

imap <Up> <C-o>gk
imap <Down> <C-o>gj

syntax on

" set leader to space, instead of \\s or \\w, just <space>
let mapleader = "\<Space>"

" yy, D, and P work with the clipboard, no need to prefix with \"* or "+
set clipboard=unnamed

" stay at centre of screen for convenience
nmap G Gzz
nmap n nzz
nmap N Nzz

" map <C-v> "+p
" vnoremap <C-c> "+y

set backspace=indent,eol,start
" 14j, f{letter to find}
" easymotion \\w to jump downwards only, \\s to search for something
set rnu
set background=dark
colorscheme torte 
let g:airline_theme='deus'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

execute pathogen#infect()
syntax on
filetype plugin indent on

