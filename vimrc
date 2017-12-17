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
Plug 'colepeters/spacemacs-theme.vim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/LeaderF'
Plug 'vim-scripts/gtags.vim'
Plug 'whatot/gtags-cscope.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/phd'
Plug 'derekwyatt/vim-fswitch' " 类的接口与实现快速切换

" ==========周期性对工程自动生成标签文件===============
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
" ============================

Plug 'dyng/ctrlsf.vim' " ctrlsf.vim 后端调用 ack
Plug 'terryma/vim-multiple-cursors'
Plug 'derekwyatt/vim-protodef' " 根据类声明自动生成类实现的代码框架
Plug 'fholgado/minibufexpl.vim'
Plug 'gcmt/wildfire.vim' " 自然地选中结对符内的文本
Plug 'sjl/gundo.vim' " 支持分支的 undo
Plug 'Lokaltog/vim-easymotion' " 默认用 <space><space> 作为 leader 键 

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
" colorscheme phd

"=====================================================================


"===============================  Indexer =================================
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
"=====================================================================


"===============================NerdTree=================================

let NERDChristmasTree=0
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
"=====================================================================


"===============================Tagbar======================================
" #####Tagbar Configure  
let g:tagbar_width=35
let g:tagbar_autofocus=1

" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1

" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" nmap <F7> :TagbarToggle<CR>
"=====================================================================

"===============================vim-fswitch======================================
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
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

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized25'

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

cs add GTAGS

" gtags.vim 设置项
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

" #####GTags Configure 
"=====================================================================




"=============================== wildfire ======================================
" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]
"=====================================================================

"===============================youcompleteme======================================
" " YCM 补全菜单配色
" " 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" " 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" " 补全功能在注释中同样有效
" let g:ycm_complete_in_comments=1
" " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
" let g:ycm_confirm_extra_conf=0
" " 开启 YCM 标签补全引擎
" let g:ycm_collect_identifiers_from_tags_files=1
" " 引入 C++ 标准库tags
" set tags+=/data/misc/software/misc./vim/stdcpp.tags
" " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
" inoremap <leader>; <C-x><C-o>
" " 补全内容不以分割子窗口形式出现，只显示补全列表
" set completeopt-=preview
" " 从第一个键入字符就开始罗列匹配项
" let g:ycm_min_num_of_chars_for_completion=1
" " 禁止缓存匹配项，每次都重新生成匹配项
" let g:ycm_cache_omnifunc=0
" " 语法关键字补全
" let g:ycm_seed_identifiers_with_syntax=1
"=====================================================================

"===============================vim-protodef======================================
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
"=====================================================================

"=============================== MiniBufExplorer ======================================
" let g:miniBufExplMaxSize = 2

" 显示/隐藏 MiniBufExplorer 窗口。快捷键速记：buffer list
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键: ctrl-tab 正向遍历 buffer，ctrl-shift-tab 逆向遍历
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
"=====================================================================


"=============================== gundo ======================================

" 调用 gundo 树
nnoremap <Leader>ut :GundoToggle<CR>

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

" 禁止光标闪烁
set gcr=a:block-blinkon0

"设置鼠标可用
set mouse=a

"设置Tab宽度
set tabstop=4

"设置自动对齐空格数
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
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
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







