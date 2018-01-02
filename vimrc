" Sardor Vakkosov
" Vim Plug {{{
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plug 'scrooloose/nerdcommenter'   " Easily toggle comments
Plug 'flazz/vim-colorschemes' " colorschemes 
Plug 'http://github.com/sjl/gundo.vim.git' " Visual file change history 

" Plugs for PHP
Plug 'stephpy/vim-php-cs-fixer' " Plugin will execute the php-cs-fixerFp
Plug 'beanworks/vim-phpfmt' " PHP auto format plugin for vim. Formats using phpcbf
Plug 'arnaud-lb/vim-php-namespace' " Adds use statements automatically
call plug#end()
" }}}

" Colors {{{
syntax enable           " enable syntax processing
colorscheme Tomorrow-night
set termguicolors
" }}}

" Spaces & Tabs {{{
set autoindent " automatically set indent of new line
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set laststatus=2 " show the satus line all the time
" }}}

" UI Layout {{{
set number              " show line numbers
set number relativenumber
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:┃
set wildmode=longest,list " use emacs-style tab completion when selecting files, etc
set clipboard=unnamed " Use copied data putside of vim
set ttyfast " fast redrawing
" }}}

" Searching {{{
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
" }}}

" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
" }}}

" Leader Shortcuts {{{
let mapleader=","
map <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> " Sourece vimrc
nmap <leader>, :w<cr> " shortcut to save
nnoremap <leader>i :set cursorline!<cr> " toggle cursor line
nnoremap <leader>/ "fyiw :/<c-r>f<cr> " search for word under the cursor
nnoremap <leader>g :GundoToggle<CR> " toggle gundo
" }}}


" Other Mappings{{{
inoremap jk <esc> " jk is escape
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
inoremap <up> <nop>
vnoremap <up> <nop>
inoremap <down> <nop>
vnoremap <down> <nop>
inoremap <left> <nop>
vnoremap <right> <nop>
vnoremap <left> <nop>
inoremap <right> <nop>


" }}}
