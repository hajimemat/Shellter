bolt:
	sudo pacman -S --noconfirm \
		bolt
install:
	sudo pacman -S --noconfirm \
		xf86-video-{vesa,ati,intel,amdgpu,nouveau} \
		xf86-input-synaptics \
		libva-intel-driver \
		xorg-server xorg-apps xorg-xinit \
		xorg-twm xorg-xclock xterm \
		xorg-xwininfo \
		xorg-xprop \
		xdotool \
		xsel \
		arandr
	# i3
	sudo pacman -S --noconfirm --needed \
		i3-gaps sakura firefox firefox-i18n-ja 

