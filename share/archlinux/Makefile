install:
	make /etc/pacman.d/hooks/mirrorupgrade.hook
/etc/pacman.d/hooks:
	sudo mkdir $@
/etc/pacman.d/hooks/mirrorupgrade.hook: /etc/pacman.d/hooks
	sudo cp -v $(reapth mirrorupgrade.hook) $@
