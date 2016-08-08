set nocompatible
" set <Leader> as ';'
let mapleader=";"
" 开启文件类型侦测
filetype on
" 根据侦测到的不同的类型加载对应的插件
filetype plugin on

" 设置VIM常用的快捷键
" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $

:set number

" 将选中文本块复制到系统剪贴板
vnoremap <Leader>y "+y

" 设置快捷键将系统剪贴板内容粘贴到VIM 
nmap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>

" 定义快捷键保存所有窗口内容并退出VIM
nmap <Leader>WQ :wa<CR>:q<CR>

" 定义保存窗口内容
nmap <Leader>W :w<CR>

" 保存所有窗口内容
nmap <Leader>WQ :wq<CR>

" 不做任何保存，直接退出VIM
nmap <Leader>Q :qa!<CR>

" 一次遍历字窗口
nnoremap nw <C-W><C-W>

" 跳转到左方的窗口
nnoremap <Leader>hw <C-W>h

" 跳转到右方的窗口
nnoremap <Leader>lw <C-W>l

" 跳转到上方到子窗口
nnoremap <Leader>kw <C-W>k

"跳转到下方的字窗口
nnoremap <Leader>jw <C-W>j

" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 让VIMrc配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" 鼠标可用
set mouse=a

" 配色方案
syntax enable " 开启语法高亮
syntax on " 允许使用指定语法高亮配色方案代替默认方案
set background=light
colorscheme desert
" colorscheme molokai
" colorscheme phd

" 设置状态栏风格
let g:Powerline_colorscheme='solarized256'

" 总是高亮当前行/列
set cursorline
hi CursorLine cterm=none ctermbg=magenta ctermfg=white guibg=darked guifg=white
set cursorcolumn
hi CursorColumn cterm=none ctermbg=magenta ctermfg=white guibg=darked guifg=white
" 高亮搜索结果
set hlsearch

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 VIM 把连续的空格视为一个制表符
set softtabstop=4

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 VIM 的函数
fun! ToggleFullScreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullScreen()<CR>
" 启动 VIM 时自动全屏
autocmd VimEnter * call ToggleFullScreen()

" Vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于vundle#begin()和vundle#end()之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
"Plugin 'dyng/ctrlsf.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
"Plugin 'vim-scripts/vimprj'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/indexer.tar.gz'
call vundle#end()
filetype plugin indent on

" tagbar 设置 start----------------------------------
" 设置tagbar 字窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示/隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 字窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置ctags对哪些标识符生成标签
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
" tagbar 设置 end------------------------------------


" NERDTree start
" 使用NERDTREE 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=0
" NERDTree字窗口红不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应buffer
let NERDTreeAutoDeleteBuffer=1
" NERDTree end


" MINIBufExplorer 设置
" 显示/隐藏MINIBufExplorer窗口
map <Leader>bl :MBEToggle<cr>
"" buffer 切换快捷键
map <Leader>bn :MBEbn<cr>
map <Leader>bp :MBEbp<cr>

" ctrlsf
nnoremap <Leader>sp :CtrlSF<CR>


" 设置插件 indexer 调用 ctags 的参数
" " 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" " 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
"let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"


" Ctrlp
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <Leader>f :CtrlPMRU<CR>
map <Leader>p :CtrlP<CR>
let g:ctrlp_user_command = 'find %s -type f -name "*.c" -o -name "*.cpp" -o -name "*.java" -o -name "*.dts" -o -name ".dtsi" -o -name "*.mk"' 
"    \ ['.git', 'cd %s && git ls-files']
"    \ ['.git', 'cd %s && git ls-files . -co --exclude-standard']
 let g:ctrlp_custom_ignore = {
    \ 'dir': '(out|abi|AMSS|build|cts|ndk|pdk|platform_testing|prebuilds|sdk|.git|.repo)',
    \ 'file': '.(exe|so|dll|txt)',
    \  }
"    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
"    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
"    \ }
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=0
let g:ctrlp_follow_symlinks=1
" 启动缓存 可以使用F5来清除缓存
let g:ctrlp_use_caching = 1
" 退出VIM时不删除缓存
let g:ctrlp_clear_cache_on_exit=0
" 设置缓存文件的目录
let g:ctrlp_cache_dir=$HOME.'/.cache/ctrlp'
" 设置ctrlp不扫描隐藏文件和目录
let g:ctrlp_show_hidden=1
" 设置默认是否按文件名搜索（否则按全路经）
let g:ctrlp_by_filename = 1
" 当启动时，CtrlP依据这个变量来设置它的工作目录
let g:ctrlp_working_path_mode='0'

map <Leader>ack :Ack <C-R><C-W> <C-R><C-X>

" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
