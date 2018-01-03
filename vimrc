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

" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 1
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
nmap <silent> <leader>k :NERDTreeToggle<cr> " Toggle NERDTree
nmap <silent> <leader>y :NERDTreeFind<cr> " expand to the path of the file in the current buffer
nmap <silent> <leader>t :CtrlP<cr> " map fuzzyfinder (CtrlP) plugin
nmap <silent> <leader>r :CtrlPBuffer<cr>
" php namespace autocomplate
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight
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

" NerdTree {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_php = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" }}}

" CtrlP {{{
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }
" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2
" }}}

" Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Syntastic configuration for PHP
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_exec = 'phpcs'
let g:syntastic_php_phpcs_args = '--standard=psr2 '
let g:syntastic_php_phpcs_args = '---config-set show_warnings 0'
let g:syntastic_php_phpmd_exec = 'phpmd'
let g:syntastic_php_phpmd_post_args = 'codesize,controversial,design'
" Syntastic configuration for JavaScript
let g:syntastic_javascript_checkers = ['jshint']
" }}}

" Php Plugins settings {{{
" Vim-php-cs-fixer settings
let g:php_cs_fixer_rules = "@PSR2"

" phpfmt plugin settings
" A standard type: PEAR, PHPCS, PSR1, PSR2, Squiz and Zend
" https://github.com/beanworks/vim-phpfmt
let g:phpfmt_standard = 'PSR2'
" }}}

" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
augroup END
" }}}

" Custom Functions {{{
" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
" vim:foldmethod=marker:foldlevel=0
