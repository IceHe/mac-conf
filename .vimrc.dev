" Not useful for 'spf13-vim' or 'Neovim'!
" ---------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}


" MY PLUGINS {

"相较于Command-T等查找文件的插件，ctrlp.vim最大的好处在于没有依赖，干净利落
Bundle 'ctrlp.vim'

"显示行末的空格；
Bundle 'ShowTrailingWhitespace'

"用全新的方式在文档中高效的移动光标，革命性的突破
Bundle 'EasyMotion'

"自动识别文件编码；
Bundle 'FencView.vim'

"必不可少，在VIM的编辑窗口树状显示文件目录
Bundle 'The-NERD-tree'

"NERD出品的快速给代码加注释插件，选中，`ctrl+h`即可注释多种语言代码；
Bundle 'The-NERD-Commenter'

"CTags
"Bundle '

" }


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


" MY VIM CONFIG {

"Color Settings
"set colorcolumn=81           "彩色显示第81行
"set t_Co=16                 "设置256色显示
set background=dark          "使用color solarized
"set cursorline               "设置光标高亮显示
"set cursorcolumn             "光标垂直高亮
"set mouse=a                  "鼠标滚动
set ttyfast
set ruler
set backspace=indent,eol,start

"tab setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set scrolloff=3
set fenc=utf-8
set autoindent
set hidden
set noswapfile
set nowritebackup
set encoding=utf-8

"set laststatus=2
set number                                    "显示行号
"set undofile                                  "无限undo
"set nowrap                                    "禁止自动换行
set wrap
"autocmd! bufwritepost _vimrc source %         "自动载入配置文件不需要重启

"相对行号 要想相对行号起作用要放在显示行号后面
"set relativenumber
"自动换行
"set wrap
"GUI界面里的字体，默认有抗锯齿
set guifont=Inconsolata:h12
"将-连接符也设置为单词
set isk+=-

set ignorecase "设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch

set numberwidth=4          "行号栏的宽度
"set columns=135           "初始窗口的宽度
"set lines=50              "初始窗口的高度
"winpos 620 45             "初始窗口的位置

set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

"===================================================
"修改leader键为逗号
let mapleader=","

"系统剪切
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>p "+p
vmap <leader>p "+p

"更改NerdTree快捷键
map <leader>e :NERDTreeToggle<CR>

" Line Number
"map :set nu<CR> " Set
map <leader>n :set nu!<CR> " Toggle

" Relative Line Number
"set rnu " Set
map <leader>r :set rnu!<CR> " Toggle

"放置在Bundle的设置后，防止意外BUG
filetype plugin indent on
syntax on

"复制粘贴
set clipboard=unnamed,unnamedplus

"CTags Config
set tags=/data1/v5.weibo.cn/code/tags
" }

" Save & Quit
imap <C-S> <Esc><C-S>a
map <C-S> :w<CR>
imap <C-G> <Esc><C-G>
map <C-G> ZZ<CR>

" Relative Line Number
"set number
"set rnu
"set rnu! "取消方法
"set nonu "无行号

" Mimic Emacs Line Editing in Insert Mode Only
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi

" Fix Redo
"map <C-R> :redo<CR>
map <C-W> :redo<CR> "Fuck! Why I can't use the default <C-R>!?

