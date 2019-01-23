"
" source background for base16 shell
"
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" make vim not compatible with vi
set nocompatible

"
" COLORS & FONTS
"
syntax on                    " enable syntax highlight
set t_Co=256                 " set 256 colors
colo base16-tomorrow-night   " set base16 color scheme
set background=dark          " solarized with dark background
set cursorline               " highlight the current line
set guioptions=h             " enable bottom scrollbar if necessary
set guifont=Anonymice\ Powerline\ 16
"set guifont=Source\ Code\ Pro\ for\ Powerline\ 11
"set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
"set guifont=Roboto\ Mono\ for\ Powerline\ 11
"set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
"set guifont=Cousine\ for\ Powerline\ 10
"set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline\ Regular\ 10

"
" TABS
"
set tabstop=4                " print 4 spaces when findind \t
set softtabstop=4            " 4 spaces when type <tab> (editing file)
set shiftwidth=4             " 4 spaces of autoindent (or >> <<)
set expandtab                " convert tabs to spaces

"
" GENERAL
"
set ttyfast                  " improve smooth redrawing
set nobackup                 " dont make backups before overwrite files
set noswapfile               " dont create .swp files
set showcmd                  " show the command (partial) in ruler
set bs=indent,eol,start      " backspace to join lines, autoindent, inserts
set shell=/bin/sh            " use the system shell as internal shell
set hidden                   " enable hidden buffers
set ruler                    " enable the line/col number bar (bottom)
set number                   " enable the line number bar (left)
set modeline                 " enable files to have specific vim settings
set modelines=2              " two lines of config is considered
set laststatus=2             " always show the last wnd status
let mapleader=','            " use , to mapleader
highlight Error term=NONE ctermfg=red ctermbg=lightgrey guifg=red guibg=lightgrey

" remember up to '10 files
" save up to "100 lines
" save last :100 command history
" % saves and restores the buflist
set viminfo='10,\"100,:100,%,n~/.viminfo
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

"
" SEARCH
"
set hlsearch                 " highlight all matches
set incsearch                " search while typing
set ignorecase               " ignore the case of normal letters...
set smartcase                " ...but consider case when CAPS
highlight Search ctermbg=darkgrey ctermfg=yellow guibg=darkgrey guifg=brown

"
" FOLDING
"
set foldenable               " enable folding
set foldlevelstart=10        " open most folds by default
set foldnestmax=10           " 10 nested fold max

"
" FILES
"
set fileformats=unix,dos,mac " eof used to edit/read (\n,\r\n,\r)
filetype plugin indent on    " auto identify files and load plugins
set path+=**                 " search subfolders and tab-completition for files
set rtp+=/usr/bin/fzf        " use fuzzy in runtime path for search files
set wildmenu                 " display matching files when tab complete
set encoding=utf-8           " char encoding used inside vim
set fileencoding=utf-8       " set the encoding for current buffer file
set fileencodings=utf-8      " encoding when starting to edit an existing file


augroup configgroup
autocmd!
    autocmd VimEnter * highlight clear SignColumn
augroup END

"
" MAPPINGS
"
" split horiz.
noremap <leader>h :<C-u>split<CR>
" split vert.
noremap <leader>v :<C-u>vsplit<CR>
" edit command with path of current file
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" yank line to clipboard
noremap YY "+y<CR>
" paste frpm clipboard
noremap PP "+gP<CR>
" cut to clipboard
noremap XX "+x<CR>
" go to next buffer
noremap <leader>z :bp<CR>
" go to previous buffer
noremap <leader>x :bn<CR>
" close current buffer
noremap <leader>c :bw<CR>
" clean seach highlight
nnoremap <silent> <leader><space> :noh<cr>
" close folders recursively
noremap <leader>+ zC<cr>
" open folders recursively
noremap <leader>- zO<cr>
" open/close folder under cursor
noremap <space> za<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"
" AIRLINE
"
let g:airline_powerline_fonts=1
let g:airline_theme="base16_grayscale"
let g:airline_symbols={}
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'

"
" SCRIPTS
"
set list listchars=tab:⟶\ ,trail:·,extends:>,precedes:<,nbsp:%
set list
let c_space_errors = 1
let c_no_trail_space_error = 1
let c_no_tab_space_error = 1

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
let s:set_overlen = 0
function! ToggleOverlen()
    if s:set_overlen == 0
        let s:set_overlen = 1
        match OverLength /\%81v.\+/
    else
        let s:set_overlen = 0
        match none
    endif
endfunction
nnoremap <F6> :call ToggleOverlen()<CR>

highlight SpellBad gui=undercurl guisp=red term=underline cterm=underline ctermfg=red

nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
