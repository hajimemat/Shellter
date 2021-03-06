#
# SHELLTER
#
.PHONY: \
	vim \
	zsh \
	tmux \
	i3 \
	git \
	gitlab

preset: vim zsh tmux git

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
gitlab:
	make -f misc/lab.makefile
repos/%:
	git clone https://github.com/hajimemat/shellter-$(shell basename $@).git $@

