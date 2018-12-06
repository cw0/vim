
"to install init.vim use the following command
"$ ln -s ~/vim/init.vim ~/.config/nvim/init.vim

call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'

" Development
Plug 'w0rp/ale'
Plug 'moll/vim-node'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-projectionist'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
"Plug 'vim-syntastic/syntastic' "unused

" Editing
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'alvan/vim-closetag'
Plug 'garbas/vim-snipmate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
"Plug 'junegunn/vim-easy-align' "not configured
"Plug 't9md/vim-textmanip' "not configured 
Plug 'chrisbra/NrrwRgn' "isolate batch edits to a specific selection with :NR
Plug 'ahw/vim-pbcopy' "copy to os clipboard with cy in visual mode

" Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-sensible'  "smart defaults for basic settings

" File Managment
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tyok/nerdtree-ack'
"Plug 'jeetsukumaran/vim-buffergator' "not configured

" Motion
Plug 'Lokaltog/vim-easymotion'
Plug 'rhysd/accelerated-jk'
Plug 'terryma/vim-multiple-cursors'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
call plug#end()

"accelerated jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

let g:indent_guides_enable_on_vim_startup = 1

"match tag always
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \ 'javascript' : 1,
    \}

"closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

"neovim fix
"set notimeout

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
filetype plugin on
filetype plugin indent on
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set preserveindent
set copyindent
set noswapfile

set encoding=utf8

"highlight found words when searching
set hlsearch

"incremental search
set incsearch

"show matching parenthesis
set showmatch

"terminal colors and syntax highlighting
set t_Co=256
syntax on
set syn=auto

"disable lazy redraw
"set nolazyredraw

"set colorscheme
"colorscheme jellybeans
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

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
"let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

" Vim JSX
" let g:jsx_ext_required = 0

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
"let g:ale_sign_error = '🤮'
"let g:ale_sign_column_always = 1
"let g:ale_sign_warning = '🚩'
"let g:ale_statusline_format = ['🤮 %d', '🚩 %d', '']


" Vim Multiple Cursors
" I disabled these bindings until i finish setting up buffer controls
"
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<C-l>'
"let g:multi_cursor_prev_key='<C-h>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'


" Buffer Switching
"
" open a new empty buffer
" This replaces :tabnew
"nmap <Leader>T :enew<cr>
nmap <Leader>t :enew<CR>

" Move to the next buffer
nmap <Leader>l :bnext<CR>
nmap <Leader>] :bnext<CR>
nmap ˙ :bnext<CR>
inoremap ˙ :bnext<CR>
vnoremap ˙ :bnext<CR>


" Move to the previous buffer
nmap <Leader>h :bprevious<CR>
nmap <Leader>[ :bprevious<CR>
nmap ¬ :bprevious<CR>
inoremap ¬ :bprevious<CR>
vnoremap ¬ :bprevious<CR>


" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <Leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <Leader>bl :ls<CR>

" nmap <leader>d :bnext<CR>:bdelete #<CR>


"ack
nnoremap <Leader>a :Ack!<Space>

" Ecs to close quickfix window
nnoremap <silent> <ESC> :ccl<CR>

"rainbow parenthesis
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowTogglea
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['blue', 'yellow', 'cyan', 'magenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.js set filetype=javascript.jsx

"show hidden characters toggle
nmap <leader>l :set list! <CR>

"move lines up and down on non mac computers
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

"move lines up and down on mac
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

"
" Action: Move around window splits using alt+(h|j|k|l)
"
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>


" Tab controls
" for linux and windows users (using the control key)
map <C-S-]> gt
map <C-S-[> gT
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt
map <C-0> :tablast<CR>
map <C-S-T> :tabnew<CR>
map <C-S-D> :tabclose<CR>

"removed because i dont want to overwrite default vim commands
"nnoremap th  :tabfirst<CR>
"nnoremap tj  :tabnext<CR>
"nnoremap tk  :tabprev<CR>
"nnoremap tl  :tablast<CR>
"nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
"nnoremap tm  :tabm<Space>
"nnoremap td  :tabclose<CR>
