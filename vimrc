"=============================Vim-Plugin===============================
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'powerline/powerline'
Plug 'Raimondi/delimitMate' " 符号自动补全
Plug 'Yggdroot/indentLine'
" Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
" Plug 'colepeters/spacemacs-theme.vim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/LeaderF'
Plug 'vim-scripts/gtags.vim'
Plug 'whatot/gtags-cscope.vim'
Plug 'fholgado/minibufexpl.vim'
call plug#end()
"=====================================================================



"==============================================================
"		主题配置配置 
"==============================================================
"-------solarized----------------
" if has('gui_running')
"     set background=dark
" endif
" colorscheme solarized

"-------molokai----------------
colorscheme molokai
" colorscheme spacemacs-theme

"=====================================================================



"===============================NerdTree=================================
" #####NerdTree Configure  

let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"

" Automatically open a NERDTree if no files where specified
" autocmd vimenter * if !argc() | NERDTree | endif

" Open a NERDTree
" nmap <F6> :NERDTreeToggle<cr>
"=====================================================================


"===============================Tagbar======================================
" #####Tagbar Configure  
let g:tagbar_width=35
let g:tagbar_autofocus=1
" nmap <F7> :TagbarToggle<CR>
"=====================================================================


"===============================ctrap======================================
" #####ctrap Configure  
" 集成对ag的支持(ag是一款轻量级的搜索工具，速度非常快)
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"=====================================================================

"===============================powerline======================================
" #####powerline Configure 
let g:Powerline_symbols='unicode'
let g:minBufExplForceSyntaxEnable = 1 

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

set nocompatible
set t_Co=256

let g:minBufExplForceSyntaxEnable = 1

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set laststatus=2 
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

"=====================================================================


"==========================NERD Commenter==================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"=====================================================================


"=====================vim-expand-region===============================
" vim-expand-region Configure  
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"=====================================================================


"===============================vim surround======================================
" vim surround Configure  
" 
" Normal mode
" -----------
" ds  - delete a surrounding
" cs  - change a surrounding
" ys  - add a surrounding
" yS  - add a surrounding and place the surrounded text on a new line + indent it
" yss - add a surrounding to the whole line
" ySs - add a surrounding to the whole line, place it on a new line + indent it
" ySS - same as ySs
" Visual mode
" -----------
" s   - in visual mode, add a surrounding
" S   - in visual mode, add a surrounding but place text on new line + indent it
" Insert mode
" -----------
" <CTRL-s> - in insert mode, add a surrounding
" <CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
" <CTRL-g>s - same as <CTRL-s>
" <CTRL-g>S - same as <CTRL-s><CTRL-s>
" 
"=====================================================================


"=============================== GTags ======================================
" #####GTags Configure  
set cscopetag " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope

" gtags.vim 设置项
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

" #####GTags Configure 
"=====================================================================

"=============================== MiniBufExplorer ======================================
let g:miniBufExplMaxSize = 2
"=====================================================================



"===============================XXX======================================
" #####XXX Configure  
" #####XXX Configure 
"=====================================================================


"=====================================================================
"    Vim最最最基本配置
"    Better-Defaults
"    
"
"——————————————————————————————————————
"关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible

"配置backspace键工作方式
set backspace=indent,eol,start

"显示行号
set number

"设置在编辑过程中右下角显示光标的行列信息
set ruler

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=25

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

"突出现实当前行
set cursorline

"设置C/C++方式自动对齐
set autoindent
set cindent

"开启语法高亮功能
syntax enable
syntax on

"指定配色方案为256色
set t_Co=256

"设置搜索时忽略大小写
set ignorecase
"设置搜索时高亮匹配项
set hlsearch


"设置鼠标可用
set mouse=a

"设置Tab宽度
set tabstop=4

"设置自动对齐空格数
set shiftwidth=4

"设置按退格键时可以一次删除4个空格
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab

"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab

"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 检测文件类型
filetype on
" 针对不同的文件采用不同的缩进方式
filetype indent on
" 允许插件
filetype plugin on
" 启动智能补全
filetype plugin indent on
"——————————————————————————————————————


"——————————————————————————————————————
set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set showmode                   " show the current mode
"——————————————————————————————————————

"——————————————————————————————————————
"add by cyh 2016/5/31
set smartindent

" 定义快捷键的前缀，即<Leader>
let mapleader = "\<Space>"

" noremap <space> :

nnoremap <leader>w- :sp<CR>  " <C-w>s 也可以
nnoremap <leader>w/ :vsp<CR> " <C-w>v 也可以

nnoremap w+ <C-w>+
nnoremap w- <C-w>-
nnoremap w> <C-w>>
nnoremap w< <C-w><
nnoremap <F1> <C-w><C-w>

" 在 insert 和 command 下用 EMACS 快捷键
" moving aroung in insert mode
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" moving aroung in command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"above add by cyh
"——————————————————————————————————————

"=====================================================================







