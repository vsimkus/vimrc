" Allow Vim features (as opposed to vi)
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'indenthtml.vim'
Bundle 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'elzr/vim-json'

" Python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

Plugin 'vim-syntastic/syntastic.git'
Plugin 'jiangmiao/auto-pairs.git'

" Php
Plugin 'stanangeloff/php.vim'

" Powerline fonts needed to get triangles 
" https://github.com/powerline/fonts
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vimwiki/vimwiki'


filetype plugin indent on
set number
syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab 
set smarttab 
set shiftround 
set autoindent 
set smartindent 

set nobackup
set nowritebackup
set noswapfile
set hidden
set autoread

set ignorecase
set incsearch
set hlsearch
set showmatch
set gdefault
set hlsearch
set virtualedit+=block

set whichwrap+=<,>,h,l,[,]

colorscheme molokai
highlight Normal ctermbg=NONE guibg=NONE

" Starts NERDTree automatically
"autocmd vimenter * NERDTree
" Automatically closes a tab if the only remaining window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Start cursor in the main window (not NERDTree)
autocmd VimEnter * wincmd p

" Automatically format xml files with =
autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Enable markdown in vimwiki
autocmd FileType vimwiki call SetMarkdownOptions()
function! SetMarkdownOptions()
    call VimwikiSet('syntax', 'markdown')
    call VimwikiSet('custom_wiki2html', '$HOME/vimwiki/wiki2html.sh')
endfunction

" Add SyntasticStatus to status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let mapleader=" "
map <Leader>n :NERDTreeToggle<CR>
nnoremap <leader>q :bp<cr>:bd #<cr>

" Format the whole file
map <Leader>a gg=G<CR>
" Switch tabs
map <Leader><Left> :tabprevious<CR>
map <Leader><Right> :tabnext<CR>
" Switch buffers
map <S-Tab> :bprevious<CR>
map <Tab> :b-next<CR>

" Use system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p
" Copy-on-select (can be pasted with middle mouse button)
noremap <Leader>Y "*y
noremap <Leader>P "*p

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

let g:vimwiki_list = [{
            \ 'path': '$HOME/vimwiki',
            \ 'syntax': 'markdown',
            \ 'ext': '.md',
            \ 'path_html': '$HOME/vimwiki_html/',
            \ 'template_path': '$HOME/vimwiki/templates',
            \ 'template_default': 'default',
            \ 'template_ext': '.html',
            \ 'custom_wiki2html': '$HOME/vimwiki/wiki2html.sh',
            \ 'custom_wiki2html_args': ''}]

"Python
let python_highlight_all=1
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
