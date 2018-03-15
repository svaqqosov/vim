" Sardor Vakkosov
" Vim Plug  ****************************************** "
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plug 'scrooloose/nerdcommenter'   " Easily toggle comments
Plug 'flazz/vim-colorschemes' " colorschemes
Plug 'http://github.com/sjl/gundo.vim.git' " Visual file change history
Plug 'dkprice/vim-easygrep'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'tarekbecker/vim-yaml-formatter'
Plug 'fatih/vim-go'
Plug 'https://github.com/w0rp/ale.git' " Ale plugin for autoformating
call plug#end()

" Colors ****************************************** "
syntax enable           " enable syntax processing
colorscheme Tomorrow-night
set termguicolors


" Spaces & Tabs ****************************************** "
set autoindent " automatically set indent of new line
" set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set laststatus=4 " show the satus line all the time


" Folding  ****************************************** "
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 1


" UI Layout ****************************************** "
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


" Searching ****************************************** "
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers


" Line Shortcuts ****************************************** "
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]


" Leader Shortcuts ****************************************** "
let mapleader=","
map <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> " Sourece vimrc
nmap <leader>, :w<cr> " shortcut to save
nnoremap <leader>i :set cursorline!<cr> " toggle cursor line
nnoremap <leader>/ "fyiw :/<c-r>f<cr> " search for word under the cursor
nnoremap <leader>g :GundoToggle<CR> " toggle gundo
nmap <silent> <leader>k :NERDTreeToggle<cr> " Toggle NERDTree
nmap <silent> <leader>y :NERDTreeFind<cr> " expand to the path of the file in the current buffer

" Other Mappings ****************************************** "
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

" Go vim plugin Mappings ****************************************** "
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix" " All lists will be of type quickfix


" NerdTree  ****************************************** "
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


" CtrlP ****************************************** "
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'
nmap <silent> <leader>r :CtrlPBuffer<cr>

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }
" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

"ALE pulugin settings ********************************** "
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
" ALE pulugin fixers
let g:ale_fixers = {
            \   'javascript': ['eslint'],
            \   'json': ['fixjson'],
            \   }
let g:ale_fix_on_save = 1 " AutoFix with aviliable linter on save

" AutoGroups
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb,*.yml,*.yaml :call <SID>StripTrailingWhitespaces()
augroup END

" Autocmd settings
autocmd FileType yaml,yml let b:autoformat_autoindent=0
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab

" Custom Functions
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
