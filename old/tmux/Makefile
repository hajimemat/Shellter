TMUX_PLUGINS:=${HOME}/.tmux-settings/plugins
.PHONY: ${HOME}/.tmux.conf
all: ${HOME}/.tmux.conf ${TMUX_PLUGINS}/tpm
${HOME}/.tmux.conf:
	ln -sf $(realpath tmux.conf) $@
${TMUX_PLUGINS}:
	mkdir -p $@
${TMUX_PLUGINS}/tpm: ${TMUX_PLUGINS}
	git clone https://github.com/tmux-plugins/tpm $@
