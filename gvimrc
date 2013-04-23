set imdisable
colorscheme railscasts

augroup filetypedetect
    au BufNewFile,BufRead *.as setf actionscript
augroup END

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1

" 隠しファイルを表示する
let NERDTreeShowHidden = 1

" 引数なしで実行したとき、NERDTreeを実行する
let file_name = expand("%:p")

if has('vim_starting') && file_name == ""
    autocmd VimEnter * execute 'NERDTree ./'
    execute 'TagbarOpen ./'
endif

