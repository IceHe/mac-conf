" Enable: iMproved
if &compatible
  set nocompatible
endif

" Enable:
" - filetype detection,
" - filetype-specific scripts (ftplugins),
" - filetype-specific indent scripts.
filetype plugin indent on

" Encoding
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" crontab
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

" Undo
set undofile
set undodir=~/.vim/undo/

" Clipboard
set clipboard=unnamed

" Search
" 设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set ignorecase

" Tab == 4 Whitespaces
set ts=4
set shiftwidth=4
set expandtab
set autoindent

" Line Break
set wrap

" Line Number
set nu

" Leader Key
let mapleader = ','

" Toggle Line Number
map <leader>n :set nu!<CR> " Toggle

" Toggle Relative Line Number
map <leader>r :set rnu!<CR> " Toggle

" Save & Quit
imap <C-S> <Esc><C-S>a
map <C-S> :w!<CR>
imap <C-G> <Esc><C-G>
map <C-G> ZZ<CR>

" Mimic Emacs Line Editing in Insert Mode Only
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi

" Copy to EOL (end of line)
map <S-Y> v$hy

" Line Comment
map <leader>c ^i//<Esc>
map <leader><S-C> ^xx<Esc>

" HTML Comment
map <leader>h ^i<!-- <Esc>$a --><Esc>
map <leader><S-H> ^xxxxx$xxxx
