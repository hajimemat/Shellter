install:
	$(realpath .)/var/repo/fzf/install --all
	find $(realpath .)/var/repo/fzf/bin -type f -executable -exec ln -sf {} $(realpath ./)/bin \;
clone:
	git clone https://github.com/junegunn/fzf $(realpath ./)/var/repo/fzf
