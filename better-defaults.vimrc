
"============================== start =======================================
" 处理各个操作系统之间、命令行和GUI之间的差异性配置
" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
let g:isWindows = 0
let g:isMac = 0
let g:isLinux = 0
if (has("win32") || has("win64") || has("win95") || has("win16"))
    let g:isWindows = 1
elseif (has("mac"))
    let g:isMac = 1
else
    let g:isLinux = 1
endif



" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
let g:isGUI = 0
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
  


if (g:isWindows == 1) && (g:isGUI == 1) 
    " 格式为，字体类型：字体大小：字符集：显示质量，例如，Consolas:h12:cGB2312:qDRAFT
    set guifont=Consolas:h12
endif

"========================== end ===========================================




"========================== start ===========================================
"    Vim最最最基本配置
"    Better-Defaults
"    
"
"————————————————— start —————————————————————
"关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible

"配置backspace键工作方式
set backspace=indent,eol,start

" vim 自身命令行模式智能补全
set wildmenu

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


" 高亮显示当前行/列
set cursorline
set cursorcolumn

"设置C/C++方式自动对齐
set autoindent
set cindent

"开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

"指定配色方案为256色
set t_Co=256


" 禁止显示滚动条
" set guioptions-=l
" set guioptions-=L
" set guioptions-=r
" set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2



" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC


" 开启实时搜索功能，即输入内容时就显示搜索结果
set incsearch
"设置搜索时忽略大小写
set ignorecase
"设置搜索时高亮匹配项
set hlsearch

" 禁止光标闪烁
set gcr=a:block-blinkon0

"设置鼠标可用
set mouse=a

" 设置编辑时制表符占用空格数
set tabstop=4

" 设置格式化时制表符占用空格数
set shiftwidth=4

"让 vim 把连续数量的空格视为一个制表符，这样按退格键时可以一次删除 4 个空格
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

" 基于缩进或语法进行代码折叠  
" 操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠。
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable


set smartindent


" set auto-indenting on for programming
set ai          
 
" automatically show matching brackets. works like it does in bbedit.               
set showmatch  

" turn on the "visual bell" - which is much quieter than the "audio blink"                 
set vb 

" show the current mode                         
set showmode                   
"———————————————— end ——————————————————————



"——————————————— start ———————————————————————
"add by cyh 2016/5/31

" 定义快捷键的前缀，即<Leader>
let mapleader = "\<Space>"

" noremap <space> :

" 水平切分分屏
nnoremap <leader>w- :sp<CR>  " <C-w>s 也可以
" 竖直切分分屏
nnoremap <leader>w/ :vsp<CR> " <C-w>v 也可以

nnoremap w+ <C-w>+
nnoremap w- <C-w>-
nnoremap w> <C-w>>
nnoremap w< <C-w><
nnoremap <leader>ww <C-w><C-w>  “ 切换窗口

" 在 insert 和 command 下可以使用 EMACS 快捷键
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
"————————————————— end —————————————————————

"========================== end ===========================================




