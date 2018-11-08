
"to install init.vim use the following command
"$ ln -s ~/vim/init.vim ~/.config/nvim/init.vim

call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.
call plug#end()

"add a colored column at 90 so our files don't get too wide
set colorcolumn=90

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
