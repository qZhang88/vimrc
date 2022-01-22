" Startup {{{
filetype indent plugin on

augroup vimrcEx
au!
autocmd FileType text setlocal textwidth=78
augroup END

" vim 文件折叠方式为 marker
augroup ft_vim
au!
autocmd FileType vim setlocal foldmethod=indent
" 打开文件总是定位到上次编辑的位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
" }}}


" General {{{
set nocompatible
set nobackup
set noswapfile
set nu
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start
" Vim 的默认寄存器和系统剪贴板共享
set clipboard+=unnamed
set foldmethod=indent
" Enable folding with the spacebar
nnoremap <space> za
set tabstop=2
set shiftwidth=2
set expandtab
" }}}


" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
let $LANG = 'en_US.UTF-8'
" }}}


" GUI {{{
colorscheme Tomorrow-Night

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set cursorline
set hlsearch
set number
" 分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright

set statusline=%f
set statusline+=%m
set statusline+=\ %{fugitive#head()}
set statusline+=%=
set statusline+=%{''.(&fenc!=''?&fenc:&enc).''}
set statusline+=/
set statusline +=%{&ff}            "file format
set statusline+=\ -\      " Separator
set statusline+=%l/%L
set statusline+=[%p%%]
set statusline+=\ -\      " Separator
set statusline +=%1*\ %y\ %*

" set right margin highlight, ref:
" https://stackoverflow.com/questions/2447109/showing-a-different-background-colour-in-vim-past-80-characters?rq=1
let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermbg=237 guibg=#2c2d27

" }}}


" Keymap {{{
let mapleader=","

nmap <leader>s :source $MYVIMRC<cr>
nmap <leader>e :e $MYVIMRC<cr>

nmap <leader>tn :tabnew<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>th :tabp<cr>
nmap <leader>tl :tabn<cr>

" 移动分割窗口
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" 正常模式下 alt+j,k,h,l 调整分割窗口大小
nnoremap <M-j> :resize +5<cr>
nnoremap <M-k> :resize -5<cr>
nnoremap <M-h> :vertical resize -5<cr>
nnoremap <M-l> :vertical resize +5<cr>

" 插入模式移动光标 alt + 方向键
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>

" IDE like delete
inoremap <C-BS> <Esc>bdei

nnoremap vv ^vg_
" 转换当前行为大写
" inoremap <C-u> <esc>mzgUiw`za
" 命令模式下的行首尾
cnoremap <C-a> <home>
cnoremap <C-e> <end>

nnoremap <F2> :setlocal number!<cr>
nnoremap <leader>w :set wrap!<cr>

imap <C-v> "+gP
vmap <C-c> "+y
vnoremap <BS> d
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
imap <C-V> "+gP
map <S-Insert> "+gP
cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" 打开当前目录 windows
nmap <silent> <leader>ex :!start explorer %:p:h<CR>

" 打开当前目录CMD
nmap <silent> <leader>cmd :!start cmd /k cd %:p:h<cr>
" 打印当前时间
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

" 复制当前文件/路径到剪贴板
nmap ,fn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
nmap ,fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

"设置切换Buffer快捷键"
nnoremap <S-H> :bp<CR>
nnoremap <S-L> :bn<CR>

" }}}

let g:python3_host_prog = '/Users/qz/miniconda3/bin/python'

" vim-plug {{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'scrooloose/nerdtree'
let NERDTreeIgnore=['.idea', '.vscode', 'node_modules', '*.pyc', '\.pyc$', '\~$']
let NERDTreeBookmarksFile = $VIM . '/NERDTreeBookmarks'
let NERDTreeMinimalUI = 1
let NERDTreeBookmarksSort = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeShowBookmarks = 1
let g:NERDTreeWinPos = 'left'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
nmap <leader>n :NERDTreeToggle <cr>
" if exists('g:NERDTreeWinPos')
"     autocmd vimenter * NERDTree
" endif

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"set laststatus=2
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ervandew/supertab'
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'deoplete-plugins/deoplete-jedi'

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'honza/vim-snippets'

" vimtex
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:Tex_CompileRule_pdf='xelatex -synctex=1 --interaction=nonstopmode $*'
let g:vimtex_compiler_latexmk_engines={'_':'-xelatex'}
let g:vimtex_compiler_latexrun_engines={'_':'xelatex'}
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_view_general_viewer
\ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
" This adds a callback hook that updates Skim after compilation
let g:vimtex_compiler_callback_hooks = ['UpdateSkim']

function! UpdateSkim(status)
if !a:status | return | endif

let l:out = b:vimtex.out()
let l:tex = expand('%:p')
let l:cmd = [g:vimtex_view_general_viewer, '-r']

if !empty(system('pgrep Skim'))
call extend(l:cmd, ['-g'])
endif

if has('nvim')
call jobstart(l:cmd + [line('.'), l:out, l:tex])
elseif has('job')
call job_start(l:cmd + [line('.'), l:out, l:tex])
else
call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
endif
endfunction

" Initialize plugin system
call plug#end()
" }}}


" Python {{{
:syntax on

" PEP 8
au BufNewFile,BufRead *.py
\ set tabstop=2     |
\ set softtabstop=2 |
\ set shiftwidth=2  |
\ set textwidth=100 |
\ set autoindent    |
\ set fileformat=unix


" python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

" }}}


" Function {{{
" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil
" @see http://blog.bs2.to/post/EdwardLee/17961
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
" }}}
