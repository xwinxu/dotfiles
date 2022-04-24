set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-sensible'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/netrw.vim'
Plugin 'Valloric/MatchTagAlways'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
nnoremap <Leader>pp :let @0=expand('%') <Bar> :Clip<CR> :echo expand('%')<CR>
nnoremap <Leader>p :echo expand('%')<CR>

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

" execute pathogen#infect()
syntax on
filetype plugin indent on

