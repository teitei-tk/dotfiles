.PHONY: init
init: brew-install brew-bundle setup install-powerline-fonts install-vim-packages
	@echo "---------------All init Task Finished. Successfully.---------------"

.PHONY: shellcheck
shellcheck:
	shellcheck setup.sh vscode/sync.sh

.PHONY: dump
dump: setup-vscode
	brew bundle dump --force

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

.PHONY: brew-install
brew-install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

.PHONY: brew-bundle
brew-bundle:
	brew bundle

.PHONY: install-powerline-fonts
install-powerline-fonts:
	git clone https://github.com/powerline/fonts.git --depth=1
	cd fonts && ./install.sh && cd .. && rm -rf fonts

.PHONY: install-vim-packages
install-vim-packages:
	vim -N -u ~/.vim/init.vim -c "try | call dein#install() | finally | qall! | endtry" -V1 -es