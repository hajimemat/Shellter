TMUX_PLUGINS:=${HOME}/.shellter/var/tmux/plugins
.PHONY: \
	tmux ${HOME}/.tmux.conf \
	vim ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim \
	zsh ${HOME}/.zshenv ${HOME}/.zprofile ${HOME}/.zshrc ${HOME}/.zshrc.local ${HOME}/.zlogin ${HOME}/.zlogin ${HOME}/.zpreztorc

help:
	echo make tmux vim zsh
#
# TMUX用の設定
#
tmux: ${HOME}/.tmux.conf ${TMUX_PLUGINS}/tpm
	echo 1
	make ${HOME}/.tmux.conf
	make ${TMUX_PLUGINS}/tpm
${HOME}/.tmux.conf:
	ln -sf $(realpath ./tmux/tmux.conf) $@
${TMUX_PLUGINS}:
	mkdir -p $@
${TMUX_PLUGINS}/tpm: ${TMUX_PLUGINS}
	git clone https://github.com/tmux-plugins/tpm $@

#
# VIMの設定
#
vim: ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim ${HOME}/.vimrc.local
${HOME}/.vimrc:
	ln -sf $(realpath vimrc) $@
${HOME}/.vimrc.local:
	cp $(realpath ./vimrc.local.dist) $@
${HOME}/.config:
	mkdir -p $@
${HOME}/.config/nvim: ${HOME}/.config
	mkdir -p $@
${HOME}/.config/nvim/init.vim: ${HOME}/.config/nvim
	ln -sf $(realpath ./vim/nvim.init) $@
#
# ZSHの設定
#
zsh: ${HOME}/.zshenv ${HOME}/.zprofile ${HOME}/.zshrc ${HOME}/.zshrc.local ${HOME}/.zlogin ${HOME}/.zlogin ${HOME}/.zpreztorc
${HOME}/.zshenv:
	ln -s $(realpath ./zsh/zshenv) $@
${HOME}/.zprofile:
	ln -s $(realpath ./zsh/zprofile) $@
${HOME}/.zshrc:
	ln -s $(realpath ./zsh/zshrc) $@
${HOME}/.zshrc.local:
	cp $(realpath ./zsh/zshrc.local) $@
${HOME}/.zlogin:
	ln -s $(realpath ./zsh/zlogin) $@
${HOME}/.zpreztorc:
	ln -s $(realpath ./zsh/zpreztorc) $@
git: ${HOME}/.gitconfig ${HOME}/.gitconfig.local
${HOME}/.gitconfig:
	ln -sf $(realpath ./git/config) $@
${HOME}/.gitconfig.local:
	cp $(realpath ./git/config.local) $@
