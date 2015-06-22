" ----------------------------------------------------------------------- 
" NeoBundle
" ----------------------------------------------------------------------- 
set nocompatible " be iMproved
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" load local setting
if filereadable(expand('~/.vimrc_local'))
  source ~/.vimrc_local
endif

let $PATH = "~/.anyenv/envs/pyenv/shims:".$PATH

" required!
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle "Shougo/neocomplete.vim" 
NeoBundle "Shougo/neocomplcache.vim"
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

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" syntax
NeoBundle "scrooloose/syntastic.git"

" status bar
NeoBundle 'itchyny/lightline.vim'

" colorscheme
NeoBundle 'w0ng/vim-hybrid'

" git
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'sgur/vim-gitgutter'
NeoBundleLazy 'lambdalisue/vim-gista', {
    \ 'depends': [
    \    'Shougo/unite.vim',
    \    'tyru/open-browser.vim',
    \ ],
    \ 'autoload': {
    \    'commands': ['Gista'],
    \    'mappings': '<Plug>(gista-',
    \    'unite_sources': 'gista',
    \ }}

" javascript
NeoBundleLazy 'pangloss/vim-javascript', {
    \ 'autoload' : {
    \   'filetypes' : ['javascript']
    \ }}

NeoBundleLazy 'basyura/jslint.vim', {
    \ 'autoload' : {
    \   'filetypes' : ['javascript']
    \ }}

NeoBundleLazy 'marijnh/tern_for_vim', {
    \ 'build' : 'npm install',
    \ 'autoload' : {
    \   'functions': ['tern#Complete', 'tern#Enable'],
    \   'filetypes' : 'javascript'
    \ }}

" coffee
NeoBundleLazy "kchmck/vim-coffee-script", {
    \ 'autoload': {
    \   'filetypes' : ['coffee']
    \ }}

" react
NeoBundleLazy 'mxw/vim-jsx', {
    \ 'depends' : ['pangloss/vim-javascript'],
    \ 'autoload' : {
    \   'filetypes' : ['javascript']
    \ },
    \ 'build' : {
    \   'mac' : 'npm install -g jsxhint',
    \   'linux' : 'npm install -g jsxhint'
    \ }}

" cs
NeoBundleLazy 'nosami/Omnisharp', {
    \ 'autoload': {
    \   'filetypes': ['cs']
    \  },
    \ 'build': {
    \   'windows': 'MSBuild.exe server/OmniSharp.sln /p:Platform="Any CPU"',
    \   'mac': 'xbuild server/OmniSharp.sln',
    \   'unix': 'xbuild server/OmniSharp.sln',
    \ }}

" php
NeoBundleLazy 'nishigori/vim-php-dictionary', {
    \ 'autoload' : {
    \   'filetypes' : ['php']
    \ }}

" python
NeoBundleLazy "davidhalter/jedi-vim", {
    \ "autoload": {
    \   "filetypes": ["python", "python3", "djangohtml"],
    \ },
    \ "build": {
    \   "mac": "pip install jedi",
    \   "unix": "pip install jedi",
    \ }}

NeoBundleLazy "lambdalisue/vim-django-support", {
    \ "autoload": {
    \   "filetypes": ["python", "python3", "djangohtml"]
    \ }}

NeoBundleLazy 'Flake8-vim', {
    \ "autoload": {
    \   "filetypes": ["python", "python3", "djangohtml"],
    \ }}

NeoBundleLazy "lambdalisue/vim-pyenv", {
    \ "depends": ['davidhalter/jedi-vim'],
    \ "autoload": {
    \   "filetypes": ["python", "python3", "djangohtml"]
    \ }}

NeoBundle 'Glench/Vim-Jinja2-Syntax.git'

" ruby
NeoBundleLazy 'tpope/vim-rails', {
    \ 'autoload' : {
    \   'filetypes' : ['ruby']
    \ }}

NeoBundleLazy 'vim-ruby/vim-ruby', {
    \ 'autoload' : {
    \   'filetypes': ['ruby', 'eruby', 'haml']
    \ }}

NeoBundleLazy 'ruby-matchit', {
    \ 'autoload' : {
    \     'filetypes': ['ruby', 'eruby', 'haml']
    \ }}

" swift
NeoBundleLazy 'toyamarinyon/swift.vim', {
    \ 'autoload' : {
    \   'filetypes' : ['swift']
    \ }}

NeoBundleLazy 'tokorom/neocomplete-swift-dictionary', {
    \ 'depends' : 'Shougo/neocomplete.vim', 
    \ 'on_source': 'neocomplete.vim'
    \ }

" golang
NeoBundleLazy 'fatih/vim-go', {
    \ 'autoload': {
    \   'filetypes': ['go']
    \ }}

" elixir
NeoBundleLazy 'elixir-lang/vim-elixir', {
    \ 'autoload': {
    \   'filetypes': ['elixir']
    \}}

" markdown
NeoBundle 'plasticboy/vim-markdown'

" cli
NeoBundle 'thinca/vim-quickrun'

" html
NeoBundle "mattn/emmet-vim"

" util
NeoBundle 'rking/ag.vim'
NeoBundle 'kris89/vim-multiple-cursors'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/calendar-vim'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'sorah/unite-ghq'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'Align'
NeoBundle 'AutoClose'

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
if neobundle#is_installed('neocomplete.vim')
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

elseif neobundle#is_installed('neocomplcache')
    " ------------------------------------------------------------------------ 
    " neocomplete
    " ------------------------------------------------------------------------ 
    let g:neocomplete_enable_at_startup = 1 "起動時に有効化
    function InsertTabWrapper()
        if pumvisible()
            return "\<C-n>"
        endif
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k\|<\|/'
            return "\<tab>"
        elseif exists('&omnifunc') && &omnifunc == ''
            return "\<C-n>"
        else
            return "\<C-x>\<C-o>"
        endif
    endfunction

    inoremap <tab> <C-r>=InsertTabWrapper()<CR>

    " 補完ウィンドウの設定
    set completeopt=menuone

    " 起動時に有効化
    let g:neocomplcache_enable_at_startup = 1

    " autocmpltepopを無効化
    lef g:g:acp_enableAtStartup = 0

    " 大文字が入力されるまで大文字小文字の区別を無視する
    let g:neocomplcache_enable_smart_case = 1

    " _(アンダースコア)区切りの補完を有効化
    let g:neocomplcache_enable_underbar_completion = 1

    let g:neocomplcache_enable_camel_case_completion = 1

    " ポップアップメニューで表示される候補の数
    let g:neocomplcache_max_list = 20

    " シンタックスをキャッシュするときの最小文字長
    let g:neocomplcache_min_syntax_length = 2

    " ディクショナリ定義
    let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'php' : $HOME . '/.vim/dict/php.dict',
    \ 'ctp' : $HOME . '/.vim/dict/php.dict'
    \ }

    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif

    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " スニペットを展開する。スニペットが関係しないところでは行末まで削除
    map <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
    smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"

    " 前回行われた補完をキャンセルします
    inoremap <expr><C-g> neocomplcache#undo_completion()

    " 補完候補のなかから、共通する部分を補完します
    inoremap <expr><C-l> neocomplcache#complete_common_string()

    " 改行で補完ウィンドウを閉じる
    inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"

    " <C-h>や<BS>を押したときに確実にポップアップを削除します
    inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”

    " 現在選択している候補を確定します
    inoremap <expr><C-y> neocomplcache#close_popup()

    " 現在選択している候補をキャンセルし、ポップアップを閉じます
    inoremap <expr><C-e> neocomplcache#cancel_popup()

    " snipetの配置場所
    let g:neocomplcache_snippets_dir='~/.vim/bundle/neosnippet-snippets/neosnippets/'
    imap <C-k> <plug>(neocomplcache_snippets_expand)
    smap <C-k> <plug>(neocomplcache_snippets_expand)
endif
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

" javascript
function! s:javascript_filetype_settings()
    autocmd BufLeave <buffer> call jslint#clear()
    autocmd BufWritePost <buffer> call jslint#check()
    autocmd CursorMoved <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

" coffee
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee

" Jinja2
au BufNewFile,BufRead *.jinja2,*.jinja setf jinja

" elixir
au BufRead,BufNewFile,BufReadPre *.ex,*.exs,*.eex set filetype=elixir


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

" Checking typo.
autocmd BufWriteCmd *[,*] call s:write_check_typo(expand('<afile>'))
function! s:write_check_typo(file)
    let writecmd = 'write'.(v:cmdbang ? '!' : '').' '.a:file
    if exists('b:write_check_typo_nocheck')
        execute writecmd
        return
    endif
    let prompt = "possible typo: really want to write to '" . a:file . "'?(y/n):"
    let input = input(prompt)
    if input ==# 'YES'
        execute writecmd
        let b:write_check_typo_nocheck = 1
    elseif input =~? '^y\(es\)\=$'
        execute writecmd
    endif
endfunction


" ------------------------------------------------------------------------ 
" JavaScript
" ------------------------------------------------------------------------ 
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['jsxhint']


" ------------------------------------------------------------------------ 
" csharp
" ------------------------------------------------------------------------ 
function! s:cs_settings()
    autocmd FileType cs se fenc=utf-8 bomb
    autocmd FileType cs setl omnifunc=OmniSharp#Complete
endfunction
autocmd FileType cs call s:cs_settings()

nnoremap <silent> <Leader>gd  :OmniSharpGotoDefinition<CR>


" ------------------------------------------------------------------------ 
"  python
" ------------------------------------------------------------------------ 
" jedi-vim
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
    let g:jedi#popup_on_dot = 0

    " auto setting off
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#popup_select_first = 0

    " split target
    let g:jedi#use_splits_not_buffers = "left"

    " use NeoComplete
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
endfunction

function! s:python_settings()
    " default setting
    autocmd FileType python setl nocindent
    autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

    " use jedi-vim completion
    autocmd FileType python setl omnifunc=jedi#completions

    " not preview docstring
    autocmd FileType python setl completeopt-=preview

    " writein check pep8 syntax
    let g:PyFlakeOnWrite = 1

    " disabled pep8 warning message 
    let g:PyFlakeDisabledMessages = 'E501,W402'

    " command to fix as pep8 syntax
    let g:PyFlakeRangeCommand = 'Q'
endfunction
autocmd FileType python call s:python_settings()

" pyenv
let g:pyenv#pyenv_root = "~/.anyenv/envs/pyenv"

" ------------------------------------------------------------------------ 
" Unite.vim
" ------------------------------------------------------------------------ 
let g:unite_enable_start_insert = 1

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
nnoremap <silent> <Space>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" use ag to Unite grep 
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


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

" run py.test
if executable('py.test')
    let g:quickrun_config['python.pytest'] = {
        \ 'command': 'py.test',
        \ 'cmdopt': '-s -v -n',
        \ 'hook/shebang/enable': 0,
        \ }
endif

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"


" ------------------------------------------------------------------------
" VimShell
" ------------------------------------------------------------------------
nnoremap <silent> <F3> :VimShell -split<CR>


" ------------------------------------------------------------------------
" vimfiler
" ------------------------------------------------------------------------
nnoremap <silent> <F2> :VimFiler -buffer-name=explorer -split -toggle -no-quit<Cr>



" ----------------------------------------------------------------------- 
" NeoSinppet
" ----------------------------------------------------------------------- 
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"
  
" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif


" ------------------------------------------------------------------------
" colorscheme
" ------------------------------------------------------------------------
colorscheme hybrid


" ------------------------------------------------------------------------
" vim-gitgutter
" ------------------------------------------------------------------------
nnoremap <silent> <Leader>gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> <Leader>gh :<C-u>GitGutterLineHighlightsToggle<CR>

" vimprocを使用する
if neobundle#is_installed("vimproc")
    let g:gitgutter_system_function       = 'vimproc#system'
    let g:gitgutter_system_error_function = 'vimproc#get_last_status'
    let g:gitgutter_shellescape_function  = 'vimproc#shellescape'
endif


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
let g:indent_guides_enable_on_vim_startup=1

" amount of start a indentation
let g:indent_guides_start_level=2

" disabled auto color
let g:indent_guides_auto_colors=0

" odd number indent color
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray

" even number indent color
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray

" highlight color amplitude
let g:indent_guides_color_change_percent = 30

" indent guide size
let g:indent_guides_guide_size = 1


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
