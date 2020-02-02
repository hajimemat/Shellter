install:
		make -f $(MAKEFILE_LIST) /usr/local/bin/lab
/usr/local/bin/lab:
	curl -s https://raw.githubusercontent.com/zaquestion/lab/master/install.sh | sudo bash
