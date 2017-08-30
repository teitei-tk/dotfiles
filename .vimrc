" -----------------------------------------------------------------------
" NeoBundle
" -----------------------------------------------------------------------
set nocompatible " be iMproved
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" required!
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'

NeoBundle "Shougo/neocomplete.vim"
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'Shougo/vimshell.vim'
NeoBundleLazy 'Shougo/vimproc', {
    \ 'build' : {
    \    'windows' : 'make -f make_mingw32.mak',
    \    'cygwin' : 'make -f make_cygwin.mak',
    \    'mac' : 'make -f make_mac.mak',
    \    'unix' : 'make -f make_unix.mak',
    \    },
    \ }

" syntax
NeoBundle "scrooloose/syntastic.git"

" status bar
NeoBundle 'itchyny/lightline.vim'

" colorscheme
NeoBundle 'w0ng/vim-hybrid'

" cli
NeoBundle 'thinca/vim-quickrun'

" util
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kris89/vim-multiple-cursors'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-surround'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'sorah/unite-ghq'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'Align'
NeoBundle 'AutoClose'
call neobundle#end()

" required!
filetype plugin indent on
filetype indent on
syntax on

" -----------------------------------------------------------------------
" Setting
" -----------------------------------------------------------------------
" modify <Leader> to ','
let mapleader = ","
set encoding=utf-8
set number
set showmatch

" indent setting
set expandtab
set smarttab
set softtabstop=4 tabstop=4 shiftwidth=4

" do backup yourself
set noswapfile
set nobackup

" No Beep Sound
set vb t_vb=

" record on undo history
set undofile
set undodir=~/.vim/vimundo

" ------------------------------------------------------------------------
" neocomplete
" ------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Use camel case
let g:neocomplete#enable_camel_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" set comlete list count
let g:neocomplete#max_list = 20

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

" cancel last completion
inoremap <expr><C-g> neocomplete#undo_completion()

" common complete setting
inoremap <expr><C-l> neocomplete#complete_common_string()

" popup close
inoremap <expr><CR> neocomplete#smart_close_popup() . "\<CR>"
inoremap <expr><C-y> neocomplete#smart_close_popup() . "\<C-h>"

if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif

let g:neocomplete#sources.cs = ['omni']

if !exists('g:neocomplete#sources#omni')
    let g:neocomplete#sources#omni = {}
endif

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#force_omni_input_patterns.cs = '.*[^=\);]'

let g:neocomplete#enable_refresh_always = 0
let g:echodoc_enable_at_startup = 1
let g:neocomplete#enable_insert_char_pre = 1

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"


" ------------------------------------------------------------------------
" lang setting
" ------------------------------------------------------------------------
" ruby
function! s:ruby_settings()
    setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab
endfunction
autocmd FileType ruby call s:ruby_settings()

" yaml
function! s:yaml_settings()
    autocmd FileType yaml setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab
endfunction
autocmd FileType yaml call s:yaml_settings()

" coffee
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee

" Jinja2
au BufNewFile,BufRead *.jinja2,*.jinja setf jinja


" ------------------------------------------------------------------------
" util
" ------------------------------------------------------------------------
" multi_byte setting
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" ------------------------------------------------------------------------
" Unite.vim
" ------------------------------------------------------------------------
let g:unite_enable_start_insert = 1 " start as insert mode

if executable("ghq")
    noremap <silent> <Space>6 :<C-u>Unite ghq<CR>
endif

" files
nnoremap <silent> <Space>7 :<C-u>Unite file<CR>

" buffer
nnoremap <silent> <Space>8 :<C-u>Unite buffer<CR>

" use file list
nnoremap <silent> <Space>9 :<C-u>Unite file_mru<CR>

" bookmark
nnoremap <silent> <Space>0 :<C-u>Unite bookmark<CR>

" grep shortcut
nnoremap <silent> <Space>f  :<C-u>Unite grep: -buffer-name=search-buffer<CR>

" grep cursor word
nnoremap <silent> <Space>g :<C-u>Ack <cword><CR>

" ------------------------------------------------------------------------
" vim-quickrun
" ------------------------------------------------------------------------
"  runnerにvimprocを使用して非同期に
if neobundle#is_installed("vimproc")
    let g:quickrun_config = {
        \ "_" : {
        \    "runner" : "vimproc",
        \    "runner/vimproc/updatetime" : 60
        \ }}
endif

" ------------------------------------------------------------------------
" colorscheme
" ------------------------------------------------------------------------
set background=dark
colorscheme hybrid

" ------------------------------------------------------------------------
" vim-choosewin
" ------------------------------------------------------------------------
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
let g:choosewin_overlay_clear_multibyte = 1


" ------------------------------------------------------------------------
" vim-multiple-cursors
" ------------------------------------------------------------------------
function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
    echo 'Disabled autocomplete'
endfunction

function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
    echo 'Enabled autocomplete'
endfunction


" ------------------------------------------------------------------------
" vim-indent-guides
" ------------------------------------------------------------------------
" launch and enable vim-indent-guide at the start of vim
let g:indent_guides_enable_on_vim_startup = 1

" amount of start a indentation
let g:indent_guides_start_level = 2

" disabled auto color
let g:indent_guides_auto_colors = 0

" odd number indent color
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray

" even number indent color
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray

" highlight color amplitude
let g:indent_guides_color_change_percent = 30

" indent guide size
let g:indent_guides_guide_size = 1

" ------------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------------
autocmd StdinReadPre * let s:std_in=1

let g:NERDTreeShowBookmarks=1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '▼'

nnoremap <silent> <D-1> :<C-u>NERDTreeToggle<CR>

" ------------------------------------------------------------------------
" lightline
" ------------------------------------------------------------------------
set laststatus=2

if !has('gui_running')
    set t_Co=256
endif

let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'mode_map': { 'c': 'NORMAL' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
    \   'right': [ [ 'date' ], [ 'fileformat', 'filetype', 'fileencoding' ], ]
    \ },
    \ 'component_function': {
    \   'modified': 'MyModified',
    \   'readonly': 'MyReadonly',
    \   'fugitive': 'MyFugitive',
    \   'filename': 'MyFilename',
    \   'fileformat': 'MyFileformat',
    \   'filetype': 'MyFiletype',
    \   'fileencoding': 'MyFileencoding',
    \   'mode': 'MyMode',
    \   'date' : 'CurrentDatetime'
    \ },
    \ 'separator': { 'left': '⮀', 'right': '⮂' },
    \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
    \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction


function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%') ? expand('%') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? '⭠ '._ : ''
    endif
    return ''
endfunction

function! MyFileformat()
    return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! CurrentDatetime()
    return strftime("%x %H:%M")
endfunction
