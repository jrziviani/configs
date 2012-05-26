filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set copyindent
set backspace=indent,eol,start
set showcmd
set showmode
set hidden

set wildmenu
set wildmode=list:longest

set number
set cursorline
set ttyfast
set ruler
set undofile
set laststatus=2
"set relativenumber
set title
"set visualbell
set noerrorbells
set nobackup
set noswapfile
set nolist

set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000

set pastetoggle=<F2>

set fileformats="unix,dos,mac"

nnoremap / /\v
vnoremap / /\v

nnoremap <leader><space> :noh<cr>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
