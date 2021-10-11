runtime! packages/dein/dein.vim

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

if has("clipboard")
  set clipboard=unnamed
endif

" ------------------------------------------------------------------------
" each language setting
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
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '▼'

nnoremap <silent> <C-e> :<C-u>NERDTreeToggle<CR>

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
