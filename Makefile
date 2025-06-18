.PHONY: init
init: brew-bundle-taps brew-bundle brew-bundle-mas brew-bundle-cask setup install-powerline-fonts install-vim-packages
	@echo "---------------All init Task Finished. Successfully.---------------"

.PHONY: ci
ci: brew-bundle-taps brew-bundle brew-bundle-cask setup install-powerline-fonts install-vim-packages
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
setup-vscode: brew-bundle-vscode brew-bundle-vscode-dump
	@echo "------------------Start Sync VSCode Settings.-----------------"
	@cd vscode/ && ./sync.sh && cd -
	@echo "--------------------Finished Successfully.--------------------"

.PHONY: brew-bundle
brew-bundle:
	brew bundle --file=./brewfiles/Brewfile

.PHONY: brew-bundle-ci
brew-bundle-ci:
	# https://github.com/actions/virtual-environments/blob/main/images/macos/macos-11-Readme.md
	grep -Ev "awscli|go|node|python|yarn|macvim|cocoapods" ./brewfiles/Brewfile > ./brewfiles/Brewfile.ci
	brew bundle --file=./brewfiles/Brewfile.ci

.PHONY: brew-bundle-mas
brew-bundle-mas:
	brew bundle --file=./brewfiles/Brewfile.mas

.PHONY: brew-bundle-cask
brew-bundle-cask:
	brew bundle --file=./brewfiles/Brewfile.cask

.PHONY: brew-bundle-taps
brew-bundle-taps:
	brew bundle --file=./brewfiles/Brewfile.taps

.PHONY: brew-bundle-vscode
brew-bundle-vscode:
	brew bundle --file=./brewfiles/Brewfile.vscode

.PHONY: brew-bundle-vscode-dump
brew-bundle-vscode-dump:
	brew bundle dump --force --vscode --file=brewfiles/Brewfile.vscode

.PHONY: brew-bundle-dump
brew-bundle-dump:
	brew bundle dump --force --brews --file=brewfiles/Brewfile
	brew bundle dump --force --vscode --file=brewfiles/Brewfile.vscode
	brew bundle dump --force --cask --file=brewfiles/Brewfile.cask
	brew bundle dump --force --taps --file=brewfiles/Brewfile.taps
	brew bundle dump --force --mas --file=brewfiles/Brewfile.mas

.PHONY: brew-bundle-cleanup
brew-bundle-cleanup:
	find ./brewfiles -type f ! -name "*.json" -exec cat {} \; | sort | uniq > ./Brewfile
	brew bundle cleanup --force --file=./Brewfile
	rm ./Brewfile

.PHONY: install-powerline-fonts
install-powerline-fonts:
	git clone https://github.com/powerline/fonts.git --depth=1
	cd fonts && ./install.sh && cd .. && rm -rf fonts

.PHONY: install-vim-packages
install-vim-packages:
	vim -N -u ~/.vim/init.vim -c "try | call dein#install() | finally | qall! | endtry" -V1 -es

.PHONY: install-textlint
install-textlint:
	yarn add -D textlint textlint-rule-preset-japanese
