.PHONY: init
init: brew-bundle brew-bundle-sensitive brew-bundle-mas setup install-powerline-fonts install-vim-packages
	@echo "---------------All init Task Finished. Successfully.---------------"

.PHONY: shellcheck
shellcheck:
	shellcheck ./**/*.sh .zprofile .zshrc .bashrc .bash_profile

.PHONY: setup
setup: setup-dotfiles setup-vscode
	@echo "---------------All Setup Task Finished. Successfully.---------------"

.PHONY: setup-dotfiles
setup-dotfiles:
	@echo	"------------Start updating dotfiles symbolic link.------------"
	@./setup.sh
	@echo "--------------------Finished Successfully.--------------------"

.PHONY: setup-vscode
setup-vscode:
	@echo "------------------Start Sync VSCode Settings.-----------------"
	@cd vscode/ && ./sync.sh && cd -
	@echo "--------------------Finished Successfully.--------------------"

.PHONY: brew-bundle
brew-bundle:
	brew bundle --file=./brewfiles/Brewfile

.PHONY: brew-bundle-ci
brew-bundle-ci:
	# https://github.com/actions/virtual-environments/blob/main/images/macos/macos-11.0-Readme.md
	grep -Ev "awscli|go|node|python|yarn|macvim" ./brewfiles/Brewfile > ./brewfiles/Brewfile.ci
	brew bundle --file=./brewfiles/Brewfile.ci

.PHONY: brew-bundle-mas
brew-bundle-mas:
	brew bundle --file=./brewfiles/Brewfile.mas

.PHONY: brew-bundle-sensitive
brew-bundle-sensitive:
	brew bundle --file=./brewfiles/Brewfile.sensitive

.PHONY: install-powerline-fonts
install-powerline-fonts:
	git clone https://github.com/powerline/fonts.git --depth=1
	cd fonts && ./install.sh && cd .. && rm -rf fonts

.PHONY: install-vim-packages
install-vim-packages:
	vim -N -u ~/.vim/init.vim -c "try | call dein#install() | finally | qall! | endtry" -V1 -es
