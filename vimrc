" Default Setting
set nu
set expandtab
set shiftwidth=4
set showmatch
set smarttab
set tabstop=4
set cursorline
set cursorcolumn
set nocompatible " be iMproved

set rtp+=~/.vim/bundle/vundle/

" swapfile
set swapfile
set directory=~/.vim/backup

" backup
set backup
set backupdir=~/.vim/backup


augroup filetypedetect
    au BufNewFile,BufRead *.as setf actionscript
    au FileType javascript call JavaScriptFold()
augroup END
filetype off " required!

" Setting For Python
autocmd FileType python setl nocindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'AutoClose'
Bundle 'The-NERD-tree'
Bundle 'snipMate'
Bundle 'majutsushi/tagbar'

" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'pangloss/vim-javascript'
Bundle 'pekepeke/titanium-vim'
Bundle "git://github.com/tpope/vim-fugitive.git"
Bundle "git://github.com/fholgado/minibufexpl.vim.git"
Bundle "scrooloose/syntastic.git"
Bundle "Shougo/neocomplcache.git"
Bundle "Glench/Vim-Jinja2-Syntax.git"
Bundle "bling/vim-airline.git"

" python
Bundle "nathanaelkane/vim-indent-guides"
"Bundle davidhalter/jedi-vim"

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Align'
Bundle 'railscasts'
Bundle 'Zenburn'
Bundle 'basyura/jslint.vim'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'

" ...
filetype plugin indent on " required!

"
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
"minibufexpl
let g:miniBufExplMapWindowNavVim=1 "hjklで移動
let g:miniBufExplSplitBelow=0 " Put new window above
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1

nnoremap <C-d> : bd<CR> " バッファを閉じる
nmap <Space> : MBEbn<CR> " 次のバッファ
nmap <C-n> : MBEbn<CR> " 次のバッファ
nmap <C-p> : MBEbp<CR> " 前のバッファ

" jslint.vim
function! s:javascript_filetype_settings()
autocmd BufLeave <buffer> call jslint#clear()
autocmd BufWritePost <buffer> call jslint#check()
autocmd CursorMoved <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

" phpLint"
augroup PHP
autocmd!
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php :set dictionary=~/.vim/php.dict
" php -lの構文チェックでエラーがなければ「No syntax errors」の一行だけ出力される
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
augroup END

" jedi-vim "
syntax on


" Jinja2
au BufNewFile,BufRead *.jinja2,*.jinja setf jinja


" ------------------------------------------------------------------------ "
" neocomplcache
let g:neocomplcache_enable_at_startup = 1 "起動時に有効化
function InsertTabWrapper()
if pumvisible()
return "\<c-n>"
endif
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k\|<\|/'
return "\<tab>"
elseif exists('&omnifunc') && &omnifunc == ''
return "\<c-n>"
else
return "\<c-x>\<c-o>"
endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

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
let g:neocomplcache_min_syntax_length = 3


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
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"

" 前回行われた補完をキャンセルします
inoremap <expr><C-g> neocomplcache#undo_completion()

" 補完候補のなかから、共通する部分を補完します
inoremap <expr><C-l> neocomplcache#complete_common_string()


" 改行で補完ウィンドウを閉じる
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"


"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"


" <C-h>や<BS>を押したときに確実にポップアップを削除します
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”


" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()


" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup()

" snipetの配置場所
let g:neocomplcache_snippets_dir='~/.vim/snippets'
imap <C-k> <plug>(neocomplcache_snippets_expand)
smap <C-k> <plug>(neocomplcache_snippets_expand)

" colorscheme
let scheme = 'zenburn'
augroup guicolorscheme
autocmd!
execute 'autocmd GUIEnter * colorscheme' scheme
augroup END
execute 'colorscheme' scheme
let g:netrw_liststyle = 3
let g:netrw_altv = 1

"------------------------------------------------------------------------"
" status Line
function! g:Date()
    return strftime("%x %H:%M")
endfunction

" gitのbranch名をstatusバーに表示
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" ステータスラインに日時を表示する
set statusline+=\ \%{g:Date()}

let g:airline_modified_detection=0
