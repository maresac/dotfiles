STOW_FLAGS = --verbose=1

.PHONY: install git vim zplug zsh

install: git vim zplug zsh

git:
	stow git $(STOW_FLAGS)

vim:
	stow vim $(STOW_FLAGS)
	vim +PlugInstall +qall

zplug:
	-[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug.git ~/.zplug

zsh: zplug
	stow zsh $(STOW_FLAGS)
