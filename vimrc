



"==================================
""    Vim基本配置
"===================================
"
""关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible
"配置backspace键工作方式
set backspace=indent,eol,start

"显示行号
set number
"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
"set nowrap

""在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=1000

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

"突出现实当前行列
"set cursorline
"set cursorcolumn

"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"设置C/C++方式自动对齐
"set autoindent
"set cindent

"开启语法高亮功能
syntax enable
syntax on

"指定配色方案为256色
set t_Co=256

"设置搜索时忽略大小写
set ignorecase

"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
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



"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on

"在当前行下面加一个横线
set cursorline


"python语法高亮特性打开
let python_highlight_all=1

"选择配色方案
colorscheme evening

"=============================
"插件管理
"=============================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"自管理bundle
Plugin 'gmarik/Vundle.vim'


"------------------------------------------------------------
"PowerLine插件 状态栏增强展示
Plugin 'Lokaltog/vim-powerline'
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'

"NerdTree,文件浏览插件
Plugin 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>
"-------------------------------------------------------------

"-------------------------------------------------------------
"Python mode,提供代码补全,文档查找,类跳转,等
Plugin 'klen/python-mode'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
"-------------------------------------------------------------


"-------------------------------------------------------------
"Jedi vim
Plugin 'davidhalter/jedi-vim'
"-------------------------------------------------------------


call vundle#end()
filetype plugin indent on

"==============================
"插件结束
"==============================


"为py文件自动加头
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(2, "# Pw @ " . strftime('%Y-%m-%d %T', localtime()))
    normal G
    normal o
    normal o
endf

autocmd bufnewfile *.py call HeaderPython()


