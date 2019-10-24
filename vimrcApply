" .vimrc - Vim configuration file Only for personal use.
"
" Copyright (c) 2018 zhendong Cao. All Rights Reserved.
"
" Maintainer: zhendongcao
"       Mail: <zhendongcao@nettech-global.com>
"    Created: 2018-12-21
" LastChange: 2018-12-22

" ---------------------------------------------------------
"  GENERAL SETTINGS
" ---------------------------------------------------------
" GENERAL: Globle General Settings {{{1
filetype plugin indent on        "自动缩进 :h filetype
syntax on                        "语法高亮 :h syntax
set   t_Co=256                   "颜色数目
set   autoindent                 "开启新行时从当前行复制缩进距离
set   autoread                   "Vim 之外修改自动重新读入
set   autowrite                  "自动把内容写回文件
set   cindent                    "根据 C 缩进规则应有的缩进距离
set   cinoptions=:4              "影响 'cindent' 重新缩进 C 程序行的方式
set   nobackup                   "不保留备份文件
"set   expandtab                  "插入 <Tab> 时使用合适数量的空格
set   tabstop=4                  "<Tab> 代表的空格数
set   mouse=a                    "鼠标可用
set   number                     "显示行号
set   history=1000               "命令历史显示1000条
set   foldenable                 "折叠
set   foldmethod=marker          "标志用于指定折叠
set   helplang=cn                "以逗号分隔的语言列表
set   hlsearch                   "高亮匹配文本
set   ignorecase                 "忽略正常字母的大小写
set   incsearch                  "显示目前输入的模式的匹配位置
set   laststatus=2               "最后一个窗口何时有状态行 0: 永不 1: 只有在有至少两个窗口时 2: 总是
set   pumheight=10               "插入模式补全的弹出菜单显示项目的最大数目
set   ruler                      "显示光标位置的行号和列号，逗号分隔
set   scrolloff=3                "光标上下两侧最少保留的屏幕行数
set   shiftwidth=4               "缩进每一步使用的空白数目
set   smartindent                "开启新行时使用智能自动缩进
set   smartcase                  "历史回忆搜索模式
set   wildignore=*.bak,*.o,*~    "文件和目录名的补全中忽略符合其中任何模式的文件
set   wildmenu                   "在命令行的上方显示可能的匹配，然后高亮首个匹配
set   wildmode=list:longest,full "指定的字符所用的补全模式 :h wildmode
set   noswapfile                 "缓冲区不使用交换文件
set   nowrap                     "设置不折行
set   ignorecase                 "搜索模式里忽略大小写
set   cursorline                 "突出当前行
set   magic                      "正则表达式匹配形式
set   tags=tags;
set   list lcs=tab:\¦\ ,trail:·,extends:»,precedes:«,nbsp:%
colorscheme mycolor_gray_modified
"}}}
" ---------------------------------------------------------
"  ACTION SETTINGS
" ---------------------------------------------------------
" ACTION: Restore Last Position {{{1
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif
"}}}
" ACTION: Switching Between Buffers {{{1
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l
"}}}
" ---------------------------------------------------------
"  PLUGIN SETTINGS
" ---------------------------------------------------------
" PLUGIN: NERDTree Settings {{{1
let g:NERDTreeWinPos = "left"
"}}}
" PLUGIN: TagList Settings {{{1
let g:Tlist_Use_Right_Window = 1
"}}}
" ---------------------------------------------------------
"  MAPPING SETTINGS
" ---------------------------------------------------------
" FUNCTION: Setting Map Leader {{{1
let mapleader=","
"}}}
" FUNCTION: Personal Map-key {{{1
nmap <F6> :NERDTreeFind<cr><cr>
nmap <leader>t gg<CR>:call TitleDet()<CR>
"nmap <leader>lkup <Plug>LookupFile<cr>
nmap <leader>f  :MRU<cr>
map  <leader><space>  :s/\s\+$//ge<cr>
map  <leader><tab>    :s/	/    /g<cr>
map  <leader>l        :s/^\zs\ze/\=printf("%02d.",line("'<") == 0 ? line(".") : line(".")-line("'<") + 1)<cr>
map  <leader>al       :%s/^\zs\ze/\=printf("%02d.", line("."))<cr>
map  <leader>dl       :%s/^\s*[0-9]*.//g<cr>
map  <leader>a<tab>   :%s/	/    /g<cr>
map  <leader>a<space> :%s/\s\+$//ge<cr>
nmap <leader>mma :set mouse=a<cr>
nmap <leader>mmv :set mouse=v<cr>
nmap <leader>1  :call PrintDebug()<cr><cr>==f"a
nmap <leader>2  :call PrintIssueTag()<cr><cr>==f#a
nmap <leader>3  :call PrintDebug_red()<cr><cr>==f"a
nmap <leader>4  :call PrintDebug_green()<cr><cr>==f"a
nmap <leader>5  :call PrintDebug_darkgreen()<cr><cr>==f"a
nmap <leader>6  :call PrintDebug_yellow()<cr><cr>==f"a
nmap <leader>7  :call PrintDebug_blue()<cr><cr>==f"a
nmap <leader>8  :call PrintDebug_purple()<cr><cr>==f"a
nmap <leader>9  :call PrintDebug_black()<cr><cr>==f"a
nmap <leader>h  :call IncludeMyDebugHeader()<cr><cr>
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
nmap <leader>zz <C-w>o
nmap <leader>gs :GetScripts<cr>
"}}}
" PLUGIN: SrcExpl Settings {{{1
nmap <C-I> <C-W>j:call g:SrcExpl_Jump()<CR>
nmap <C-O> :call g:SrcExpl_GoBack()<CR>
"}}}
" PLUGIN: Trinity Settings {{{1
if g:NERDTreeWinPos == "left"
    nmap <F5> :TrinityToggleAll<CR><C-L><CR>
    nmap <F4> :TrinityToggleNERDTree<CR><C-L><CR>
else
    nmap <F5> :TrinityToggleAll<CR>
    nmap <F4> :TrinityToggleNERDTree<CR>
endif
nmap <F3> :TrinityToggleSourceExplorer<CR>
nmap <F2> :TrinityToggleTagList<CR>
"}}}
" PLUGIN: showmarks Settings {{{1
" 默认开启showmarks
let showmarks_enable = 1
" 只显示全部的大写和小写标记
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" 对文件类型为help、quickfix和non-modifiable(不可修改)的缓冲区，则不显示标记的位置
let showmarks_ignore_type = "hqm"
" 高亮行上下层标记
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1
"}}}
" ---------------------------------------------------------
"  TOOLS CONFIGURATION
" ---------------------------------------------------------
" TOOLS: System Sheat Plate {{{1
" Map vim system shear plate by zhendongcao on 2017/8/3
" http://blog.csdn.net/lalor/article/details/7272325
map <C-c> "+y
" '%'     --- 文件打开位置，e.i. vim src/foo.txt >> src/foo.txt
" '%:p'   --- 绝对路径, e.i. /something/src/foo.txt
" '%:t'   --- foo.txt
" '%:p:h' --- something/src
nnoremap <c-c>a :let @+ = expand('%:p')<cr>
inoremap <c-c>a <ESC>:let @+ = expand('%:p')<cr>

nnoremap <c-c>n :let @+ = expand('%:t')<cr>
inoremap <c-c>n <ESC>:let @+ = expand('%:t')<cr>

nnoremap <c-c>d :let @+ = expand('%:p:h')<cr>
inoremap <c-c>d <ESC>:let @+ = expand('%:p:h')<cr>
"}}}
" TOOLS: Batch Annotation {{{1
" www.cnblogs.com/wangkongming/p/4462272.html
"}}}
" TOOLS: cscope Auto add DB {{{1
" cscope.vim
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
"}}}
" TOOLS: Auto PLUGIN Head Settings {{{1
autocmd BufNewFile *.cpp,*.vim,*.sh,*.[ch] exec ":call AutoSetTitle()"
"}}}

"----------------------------------------------------------
"  ADD BY EExuke
"----------------------------------------------------------
" FEILHEAD: add the feil Head {{{1
" ---------------------------------------------------------
"  Add by EExuke 
"  Github : github.com/EExuke
"  Created : 2019-6-28"
"  --------------------------------------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
"autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
"func SetTitle() 
"	"如果文件类型为.sh文件 
"	if &filetype == 'sh' 
"		call setline(1, "##########################################################################") 
"		call append(line("."),   "# File Name: ".expand("%")) 
"		call append(line(".")+1, "# Author: EExuke") 
"		call append(line(".")+2, "# mail: 997028792@qq.com") 
"		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
"		call append(line(".")+4, "#########################################################################") 
"		call append(line(".")+5, "#!/bin/zsh")
"		call append(line(".")+6, "PATH=/home/edison/bin:/home/edison/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin")
"		call append(line(".")+7, "export PATH")
"		call append(line(".")+8, "")
"	else 
"		call setline(1, "/*************************************************************************") 
"		call append(line("."), "    > File Name: ".expand("%")) 
"		call append(line(".")+1, "  > Author: EExuke") 
"		call append(line(".")+2, "  > Mail: 997028792@qq.com ") 
"		call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
"		call append(line(".")+4, " ************************************************************************/") 
"		call append(line(".")+5, "")
"	endif
"	if &filetype == 'cpp'
"		call append(line(".")+6, "#include<iostream>")
"		call append(line(".")+7, "using namespace std;")
"		call append(line(".")+8, "")
"	endif
"	if &filetype == 'c'
"		call append(line(".")+6, "#include<stdio.h>")
"		call append(line(".")+7, "")
"	endif
"	if &filetype == 'java'
"		call append(line(".")+6,"public class ".expand("%"))
"		call append(line(".")+7,"")
"	endif
"	"新建文件后，自动定位到文件末尾
"	autocmd BufNewFile * normal G
"endfunc 	
" ------------------------------------------------------------------
"}}}
