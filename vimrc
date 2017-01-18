
"=====================================================================
"VundleVim/Vundle.vim的官方配置示例，抄过来 
"
"Put this at the top of your .vimrc to use Vundle. Remove plugins you don't
"need, they are for illustration purposes.
"---------------------------------------------------- 
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
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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

" 自己的个性化插件
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'powerline/powerline'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'Valloric/YouCompleteMe'
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

"=====================================================================


"===============================YouCompleteMe======================================
" #####YouCompleteMe Configure  

" =======基本配置========

" 设置全局的配置文件
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  

set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228) 
 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口  

inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
  
"上下左右键的行为 会显示其他信息  
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"  
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"  
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"  
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"  

"youcompleteme  默认tab  s-tab 和自动补全冲突  
"let g:ycm_key_list_select_completion=['<C-n>']  
let g:ycm_key_list_select_completion = ['<Down>']  
"let g:ycm_key_list_previous_completion=['<C-p>']  
let g:ycm_key_list_previous_completion = ['<Up>']  

let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示  

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎  

let g:ycm_min_num_of_chars_for_completion=1 " 从第1个键入字符就开始罗列匹配项  

let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项  

let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全  


"nnoremap <leader>lo :lopen<CR> "open locationlist  
"nnoremap <leader>lc :lclose<CR>    "close locationlist  
inoremap <leader><leader> <C-x><C-o>  

"在注释输入中也能补全  
let g:ycm_complete_in_comments = 1  

"在字符串输入中也能补全  
let g:ycm_complete_in_strings = 1  

"注释和字符串中的文字也会被收入补全  
let g:ycm_collect_identifiers_from_comments_and_strings = 0  
let g:clang_user_options='|| exit 0'  

"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处  


" ==========python的补全配置============
let g:ycm_server_python_interpreter='/usr/bin/python'



" #####YouCompleteMe Configure 
"=====================================================================







"===============================NerdTree======================================
" #####NerdTree Configure  

let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"

" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open a NERDTree
nmap <F6> :NERDTreeToggle<cr>

" #####NerdTree Configure 
"=====================================================================


"===============================Tagbar======================================
" #####Tagbar Configure  
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F7> :TagbarToggle<CR>
" #####Tagbar Configure 
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
" #####ctrap Configure 
"=====================================================================

"===============================powerline======================================
" #####powerline Configure 
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
set laststatus=2 " Always display the status line
let g:Powerline_symbols='unicode'
set nocompatible 
set t_Co=256 
let g:minBufExplForceSyntaxEnable = 1 


" set guifont=Source\ Code\ Pro\ for\ Powerline:h12 
set noshowmode

" #####powerline Configure 
"=====================================================================



"===============================XXX======================================
" #####XXX Configure  
" #####XXX Configure 
"=====================================================================



"=====================================================================
"    Vim最最最基本配置
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
set history=1000

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
set ruler                       " show the cursor position all the time
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set backspace=indent,eol,start  " make that backspace key work the way it should
set nocompatible                " vi compatible is LAME
"set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
syntax on                       " turn syntax highlighting on by default
"——————————————————————————————————————

"——————————————————————————————————————
"add by cyh 2016/5/31
set number
set tabstop=4
set cursorline
set ruler
set autoindent
syntax enable
syntax on
set shiftwidth=4
set hlsearch
set smartindent
set nocompatible
set showmatch
set softtabstop=4
set ruler
set showcmd
set mouse=a

"above add by cyh
"——————————————————————————————————————

"=====================================================================


"===================================================================
"   自定义vim操作
"====================================================================

map <F2> :call Do_FileSave()<CR>
map <F3> :call Do_FileSaveAndQuit()<CR>
map <F4> :call Do_FileNotSaveAndQuit()<CR>
map <F5> :call Do_OneFileMake()<CR>

" === 当前文件保存不退出 ===
function Do_FileSave()
    let source_file_name=expand("%:t")
    if source_file_name==""
        echoh1 WarningMsg | echo "The file name is empty." | echoh1 None
        return
    endif

    execute "w"
endfunction

" === 当前文件保存退出 ===
function Do_FileSaveAndQuit()
    let source_file_name=expand("%:t")
    if source_file_name==""
        echoh1 WarningMsg | echo "The file name is empty." | echoh1 None
        return
    endif

    execute "wq"
endfunction

" === 当前文件不保存退出 ===
function Do_FileNotSaveAndQuit()
    let source_file_name=expand("%:t")
    if source_file_name==""
        echoh1 WarningMsg | echo "The file name is empty." | echoh1 None
        return
    endif

    execute "q!"
endfunction

" === 单文件编译 仅支持c、cc、cpp、go文件 ===
function Do_OneFileMake()
    if expand("%:p:h")!=getcwd()
        echoh1 WarningMsg | echo "Failed to make. This's file is not in the current dir." | echoh1 None
        return
    endif

    let source_file_name=expand("%:t")

    if source_file_name==""
        echoh1 WarningMsg | echo "The file name is empty." | echoh1 None
        return
    endif

    if ( (&filetype!="c")&&(&filetype!="cc")&&(&filetype!="cpp")&&(&filetype!="go") )
    echoh1 WarningMsg | echo "Please just make c、cc、cpp and go file." | echoh1 None
        return
    endif

    if &filetype=="c"
        set makeprg=gcc\ %\ -o\ %<
    endif

    execute "w"
    execute "silent make"
    execute "q"
endfunction
"===================================================================





