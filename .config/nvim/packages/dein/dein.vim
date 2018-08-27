"dein Scripts-----------------------------
if &compatible
  " Be iMproved
  set nocompatible
endif

" set dein cache direcotry
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_path = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_path)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
endif
execute 'set runtimepath^=' . s:dein_repo_path

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:config_dir = expand('~/.config/nvim/packages/dein')
  let s:toml = g:config_dir . '/dein.toml'
  let s:lazy_toml = g:config_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
