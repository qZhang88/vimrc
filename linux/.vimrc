set encoding=utf-8

"去掉vi的一致性"
set nocompatible

"显示行号"
set number 

" 隐藏滚动条"    
set guioptions-=r 
set guioptions-=L
set guioptions-=b

"隐藏顶部标签栏"
set showtabline=0

"设置字体"
set guifont=Monaco:h13         

syntax on  				"开启语法高亮"

set background=dark     "设置背景色"
set nowrap  			"设置不折行"
set fileformat=unix 	"设置以unix的格式保存文件"
set cindent     		"设置C样式的缩进格式"
set tabstop=4   		"设置table长度"
set shiftwidth=4        "同上"
set showmatch   		"显示匹配的括号"
set scrolloff=5     	"距离顶部和底部5行"
set laststatus=2    	"命令行为两行"
set fenc=utf-8      	"文件编码"
set backspace=2
set mouse=a     		"启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase      	"忽略大小写"
set incsearch
set hlsearch        	"高亮搜索项"
set noexpandtab     	"不允许扩展table"
set whichwrap+=<,>,h,l
set autoread
set cursorline      	"突出显示当前行"
"set cursorcolumn        "突出显示当前列"

"按F5运行python"
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
    let mp = &makeprg
   	let ef = &errorformat
   	let exeFile = expand("%:t")
   	setlocal makeprg=python\ -u
   	set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
   	silent make %
   	copen
   	let &makeprg = mp
   	let &errorformat = ef
endfunction

" PEP 8
au BufRead,BufNewFile *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix

au BufRead,BufNewFile *.js, *.html, *.css
\ set tabstop=2 | 
\ set softtabstop=2 |
\ set shiftwidth=2

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=10
" Enable folding with the spacebar
nnoremap <space> za
