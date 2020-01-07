./ideapad-laptop:
	git clone -b 4.18 https://github.com/jeremyb31/ideapad-laptop.git
install:
	sudo dkms add ./ideapad-laptop
	sudo dkms install ./ideapad-laptop/1.0
	echo "options ideapad_laptop override_has_hw_rfkill_switch=0" | sudo tee /etc/modprobe.d/ideapad_laptop.conf

