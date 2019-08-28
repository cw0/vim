"to install init.vim use the following command
"$ ln -s ~/vim/init.vim ~/.config/nvim/init.vim

call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.

" Syntax
"Plug 'MaxMEllon/vim-jsx-pretty'
"Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'sheerun/vim-polyglot'
Plug 'larsbs/vim-xmll'

" Development
Plug 'dense-analysis/ale'
Plug 'moll/vim-node'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-projectionist'
"(delete?)Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Editing
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'alvan/vim-closetag'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
"Plug 'junegunn/vim-easy-align' "not configured
"Plug 't9md/vim-textmanip' "not configured 
Plug 'chrisbra/NrrwRgn' "isolate batch edits to a specific selection with :NR
Plug 'ahw/vim-pbcopy' "copy to os clipboard with cy in visual mode
Plug 'matze/vim-move'
"Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'schickling/vim-bufonly' "close all but targeted buffer

"Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'caksoylar/vim-mysticaltutor'
Plug 'nightsense/seabird'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-sensible'  "smart defaults for basic settings
Plug 'elzr/vim-json'

" File Managment
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tyok/nerdtree-ack'
"Plug 'jeetsukumaran/vim-buffergator' "not configured
"Plug 'mhinz/vim-startify' "vim start page

"Motion
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-scripts/ZoomWin'
Plug 'rhysd/accelerated-jk'
Plug 'terryma/vim-expand-region' 
Plug 'coderifous/textobj-word-column.vim'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors' "not configured
"Plug 'wellle/targets.vim' "lets learn default movements better first

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
call plug#end()

"histogram mode for diffs
 if has('nvim-0.3.2') || has("patch-8.1.0360")
     set diffopt=filler,internal,algorithm:histogram,indent-heuristic
 endif

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"accelerated jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview

" omnifuncs
augroup omnifuncs
    autocmd!
    autocmd FileType css,scss,sass,less setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType jsx,js setlocal omnifunc=javascriptcomplete#CompleteJS " removed javascript before jsx
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  augroup end

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

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

"refresh buffer on external file write
set autoread
au CursorHold,CursorHoldI * checktime

"highlight found words when searching
set hlsearch

"incremental search
set incsearch

"show matching parenthesis
set showmatch

"relative line numbers
" set relativenumber

"highlight current line:
set cursorline

"terminal colors
"set t_Co=256
set termguicolors

"syntax setup
syntax on
set syn=auto

"set hidden characters
set list listchars=tab:>\ ,trail:-,eol:$
set list!

"disable lazy redraw
"set nolazyredraw

"set colorscheme
"colorscheme jellybeans
colorscheme gruvbox
"colorscheme mysticaltutor
"colorscheme petrel
let g:gruvbox_contrast_dark = 'hard'
hi Normal ctermbg=none
hi Terminal ctermbg=none
hi Terminal guibg=none
hi Normal guibg=none

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
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
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
"nnoremap ∆ :m .+1<CR>==
"nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

"vnoremap ∆ :m '>+1<CR>gv=gv
"vnoremap ˚ :m '<-2<CR>gv=gv

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
"TODO remap the following
"map <C-S-T> :tabnew<CR>
"map <C-S-D> :tabclose<CR>

"removed because i dont want to overwrite default vim commands
"nnoremap th  :tabfirst<CR>
"nnoremap tj  :tabnext<CR>
"nnoremap tk  :tabprev<CR>
"nnoremap tl  :tablast<CR>
"nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
"nnoremap tm  :tabm<Space>
"nnoremap td  :tabclose<CR>

"Vim-move
" Visual Mode alt+j moves selected block down
vmap ∆ <Plug>MoveBlockDown
" vmap <D-j> <Plug>MoveBlockDown

" Visual Mode alt+k moves selected block up
vmap ˚ <Plug>MoveBlockUp
" vmap <D-k> <Plug>MoveBlockUp

" alt+j Move current line down
nmap ∆ <plug>MoveLineDown
" nmap <D-j> <plug>MoveLineDown

" alt+k Move current line up
nmap ˚ <Plug>MoveLineUp
" nmap <D-k> <Plug>MoveLineUp

nmap <Leader>rt :TagbarToggle<CR>

" zoom windows
nmap <leader>zw :ZoomWin

" git stuff
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gvdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>

"COC settings
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Setup formatexpr specified filetype(s).
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>ar  <Plug>(coc-codeaction-selected)
nmap <leader>ar  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" ----------------------------------------------------------------------------
" Use gruvbox's termcolors
"
" @see https://github.com/ianks/gruvbox/blob/c7b13d9872af9fe1f5588d6ec56759489b0d7864/colors/gruvbox.vim#L137-L169
" @see https://github.com/morhetz/gruvbox/pull/93/files

" dark0 + gray
let g:terminal_color_0 = '#282828'
let g:terminal_color_8 = '#928374'

" neurtral_red + bright_red
let g:terminal_color_1 = '#cc241d'
let g:terminal_color_9 = '#fb4934'

" neutral_green + bright_green
let g:terminal_color_2 = '#98971a'
let g:terminal_color_10 = '#b8bb26'

" neutral_yellow + bright_yellow
let g:terminal_color_3 = '#d79921'
let g:terminal_color_11 = '#fabd2f'

" neutral_blue + bright_blue
let g:terminal_color_4 = '#458588'
let g:terminal_color_12 = '#83a598'

" neutral_purple + bright_purple
let g:terminal_color_5 = '#b16286'
let g:terminal_color_13 = '#d3869b'

" neutral_aqua + faded_aqua
let g:terminal_color_6 = '#689d6a'
let g:terminal_color_14 = '#8ec07c'

" light4 + light1
let g:terminal_color_7 = '#a89984'
let g:terminal_color_15 = '#ebdbb2'

" disable vim polyglot jsx
let g:polyglot_disabled = ['jsx', 'javascript', 'javascript.jsx']

" show full errors
" \cc
map <Leader>cc :cwindow<CR>:cc<CR><c-w>bz<CR><CR>
" \cn
map <Leader>cn :cwindow<CR>:cn<CR><c-w>bz<CR><CR>
" \cp
map <Leader>cp :cwindow<CR>:cp<CR><c-w>bz<CR><CR>
