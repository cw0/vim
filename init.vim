
"to install init.vim use the following command
"$ ln -s ~/vim/init.vim ~/.config/nvim/init.vim

call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mxw/vim-jsx'
call plug#end()

"add a colored column at 90 so our files don't get too wide
set colorcolumn=120

"enable line numbers
set number

"performance settings
set hidden
set history=1000

"indention settings
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

"highlight found words when searching
set hlsearch

"show matching parenthesis
set showmatch

"terminal colors and syntax highlighting
set t_Co=256
syntax on

"set colorscheme
colorscheme base16-default-dark

"language features
hi def link jsObjectKey Label

"folding
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
set foldmethod=syntax
set foldcolumn=1
let javaScript_fold=1
set foldlevelstart=99

" NERDTree settings
noremap <leader>n :NERDTree <CR>
noremap <leader>m :NERDTreeFind <CR>

" Vim JSX
let g:jsx_ext_required = 0
