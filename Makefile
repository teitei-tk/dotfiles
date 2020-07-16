BREW_RESULT := $(shell brew --version >/dev/null 2>&1 || (echo "Your command failed with $$?"))
ifeq (,${BREW_RESULT})
    BREW_EXISTS := true
else
    BREW_EXISTS := false
endif

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
ifeq (${BREW_EXISTS}, false)
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash
else
	@echo "brew file is exists. abort brew-install.
endif

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
