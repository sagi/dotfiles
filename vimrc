call plug#begin()

Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'mbbill/undotree'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'elzr/vim-json'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Allow for backspace to delete newline
set backspace=indent,eol,start

" Syntax highlighting
syntax on
filetype plugin indent on

" Display
set encoding=utf-8
set title
set ruler
set showcmd
set showmode

" Indentation
set autoindent
set shiftround
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Misc
set nowrap
set nu " set line numbers
set cc=80 " set red cursor line at the 80 character
hi comment ctermfg=green

" ### PLUGINS CONFIG###

let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['python'] = ['yapf']
let g:ale_fixers['perl'] = ['perltidy']

let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter% says %s'

let g:ale_fix_on_save = 1

highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)


set encoding=utf-8

" gitgutter
let g:gitgutter_realtime = 1
set updatetime=250


" rainbow parenthesis
let g:rainbow_active = 1
let g:rainbow_conf = {
  \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  \ 'ctermfgs': ['red','green','lightblue', 'yellow','cyan', 'magenta'],
  \ 'operators': '_,_',
  \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \ 'separately': {
  \   '*': {},
  \   'tex': {
  \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
  \   },
  \   'lisp': {
  \     'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
  \   },
  \   'vim': {
  \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
  \   },
  \   'html': {
  \     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
  \   },
  \   'css': 0,
  \ }
  \}

" Enable JSX highlighting on JS files
let g:jsx_ext_required = 0

" indentLine disables quotes in json files, this solves it
let g:vim_json_syntax_conceal = 0

" Use ripgrep
if executable('rg')
  set grepprg=rg\ --color=never
  " ripgrep respects .gitignore - to disable use --no-ignore
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob "!.git/*"'
  let g:ctrlp_use_caching = 0
endif

" ack.vim
let g:ackprg = 'rg --vimgrep --no-heading'

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Ignore specific directories for CtrlP - applied when ripgrep isn't installed.
let g:ctrlp_custom_ignore = {
\ 'dir':  '.git$\|node_modules$',
\ }
let g:ctrlp_show_hidden = 1

" ### MAPS ###

let mapleader = ","

" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
" search current word (the one the cursor is on) with ack
noremap <Leader>as :Ack <cword><cr>


" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Exit from insert mode:
:imap jj <Esc>

" Quit
nnoremap <silent> <leader>qq :q<CR>
nnoremap <silent> <leader>qa :qa<CR>

" undotree
nnoremap <F5> :UndotreeToggle<cr>

" save
noremap <Leader>s :update<CR>

" F2 - Hebrew
imap <f2> <c-o>:call ToggleHebrew()<cr>
map <f2> :call ToggleHebrew()<cr>

" COC.vim
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:coc_global_extensions = ['coc-tsserver', 'coc-json' ]


" Nerdtree
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
" close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" yarn build
noremap <Leader>b :!yarn build<CR>
noremap <Leader>d :!yarn deploy<CR>
noremap <Leader>tf :!yarn test %<CR>
noremap <Leader>ta :!yarn test<CR>

" Prettier
nnoremap gp :silent %!yarn prettier --stdin --no-semi --single-quote --trailing-comma es5 <CR>

" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" Exit from insert mode:
:imap jj <Esc>
