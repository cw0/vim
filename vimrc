"to install vimrc use the following command
"$ ln -s ~/vim/vimrc ~/.vimrc

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

"source ~/.vim_runtime/my_configs.vim
"catch
"endtry

"add a colored column at 90 so our files don't get too wide
set colorcolumn=90

"enable line numbers
set number

"performance settings
set hidden
set history=100

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

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

"cancel search with escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

"remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

"set a customer mapleader with
"let mapleader=" "

map /s :source ~/.vimrc<CR>

call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'

call plug#end()
