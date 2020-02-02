#
# SHELLTER
#
.PHONY: \
	preset \
	vim \
	zsh \
	tmux \
	fzf \
	ghq \
	git

preset: vim zsh tmux

# Git
git: repos/git
	cd repos/git && git pull && make
zsh: repos/zsh
	cd repos/zsh && git pull && make
vim: repos/vim
	cd repos/vim && git pull && make
tmux: repos/tmux
	cd repos/tmux && git pull && make
i3: repos/i3
	cd repos/i3 && git pull && make
repos/%:
	git clone https://github.com/hajimemat/shellter-$(shell basename $@).git $@

