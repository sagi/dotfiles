call plug#begin()

Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'mbbill/undotree'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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


" FZF.vim

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()


" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Ignore specific directories for CtrlP - applied when ripgrep isn't installed.
let g:ctrlp_custom_ignore = {
\ 'dir':  '.git$\|node_modules$',
\ }
let g:ctrlp_show_hidden = 1

" ### MAPS ###

let mapleader = ","

" FZF.vim
"
nnoremap <C-p> :ProjectFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>
nnoremap <Leader>rg :Rg<CR>
nnoremap <Leader>c :Commits<CR>
nnoremap <Leader>bc :BCommits<CR>


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

let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-eslint', 'coc-prettier' ]


" Nerdtree
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
" close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Fugitive
noremap <Leader>gst :Gstatus<cr>
noremap <Leader>gd :Gdiff<cr>
noremap <Leader>ga :Gwrite<cr>
noremap <Leader>ga :Gwrite<cr>

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
imap jj <Esc>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> <Leader>i <Plug>(coc-diagnostic-info)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
