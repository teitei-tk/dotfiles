# Setup
1. <code>$ pip install fabric</code>
1. <code>$ git clone git://github.com:teitei-tk/MyDotfiles.git </code>
1. <code>$ cd /path/to/MyDotfiles/</code>
1. <code>$ fab setup_for_all</code>


## more
#### tmux-powerline font
* <code> $ brew install fontforge </code>
* <code> $ sudo cp /System/Library/Fonts/Ricty-Regular.ttf $HOME/.font/ </code>
* <code> $ fontforge -script $HOME/.bundle/powerline/font/fontpatcher.py $HOME/.font/Ricty-Regular.ttf </code>
</code>
* http://qiita.com/alpaca_taichou/items/ab70f914a6a577e25d70

## etc
#### tmux-powerline color
* branch symbolを変える場合は以下のファイルを編集
	* ~/.tmux/tmux-powerline/segments/vcs_branch.sh
	* <code>
	       echo "]${branch_symbol} #[fg=colour42]${branch}"  
	  </code>

#### make OmniSharp solution file
* Unity -> Assets -> Sync MonoDevelop Project
