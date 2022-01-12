call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'chrisbra/recover.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax


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
nnoremap <C-b> :Buffers<CR>
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

func! ToggleHebrew()
  if &rl
    set norl
    set keymap=
  else
    set rl
    set keymap=hebrew
  end
endfunc




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
noremap <Leader>tu :!yarn test -u %<CR>
noremap <Leader>ta :!yarn test<CR>

" Prettier
nnoremap gp :silent %!yarn prettier --stdin --no-semi --single-quote --trailing-comma es5 <CR>

" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

" Exit from insert mode:
imap jj <Esc>


"COC.VIM"
"
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-eslint', 'coc-prettier' ]

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

colorscheme dracula
