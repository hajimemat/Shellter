source: $(HOME)/src/abs/yay
$(HOME)src/abs/yay:
	mkdir -p $(HOME)/src/abs
	cd $(HOME)/src/abs && git clone https://aur.archlinux.org/yay.git
	cd $(HOME)/src/abs/yay && makepkg -si
	yay --version
