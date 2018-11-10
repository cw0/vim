
"to install init.vim use the following command
"$ ln -s ~/vim/init.vim ~/.config/nvim/init.vim

call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mxw/vim-jsx'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mileszs/ack.vim'
Plug 'tyok/nerdtree-ack'
Plug 'honza/vim-snippets'
call plug#end()

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

"add a colored column at 90 so our files don't get too wide
set colorcolumn=120

" Show the statusline
set laststatus=2

"enable line numbers
set number
set ruler

" Allow mouse usage
set mouse=a

"background
set background=dark


set display+=lastline

" No bells on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show the statusline
set laststatus=2

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

"incremental search
set incsearch

"show matching parenthesis
set showmatch

"terminal colors and syntax highlighting
"set t_Co=256
syntax on

"set colorscheme
"colorscheme jellybeans

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

" CtrlP
let g:ctrlp_map = '<C-p>' 
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Powerline Font for MacVim
set guifont=Menlo\ For\ Powerline

" ALE
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_sign_error = '🤮'
let g:ale_sign_warning = '🚩'
let g:ale_statusline_format = ['🤮 %d', '🚩 %d', '']

" Vim Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-l>'
let g:multi_cursor_prev_key='<C-h>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Buffer Switching
:noremap <C-n> :bnext<CR>
:noremap <C-p> :bprevious<CR>
:nmap <leader>d :bnext<CR>:bdelete #<CR>

"ack
nnoremap <Leader>a :Ack!<Space>

" Ecs to close quickfix window
nnoremap <silent> <ESC> :ccl<CR>
