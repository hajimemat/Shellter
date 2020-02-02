# 初期処理
install:
	yum -y install epel-release
zsh_install:
	yum install zsh
	git clone https://github.com/zsh-users/zsh-completions.git $(realpath ./)/var/repo/zsh-completions
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "$(realpath ./)/var/repo/zprezto"
tmux_install:
	# wget https://github.com/tmux/tmux/releases/download/2.9a/tmux-2.9a.tar.gz -O - | tar zxf - -C $(realpath ./)/var/repo/
	# yum -y  install gcc libevent-devel ncurses-devel
	# cd $(realpath ./)/var/repo/tmux-2.9a && ./configure  && make && make install

neovim: python
	yum -y install neovim
python:
	yum -y install gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel
pyenv:
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
	source $(realpath ./nvim.profile.sh)
	pyenv install 2.7.14
	pyenv install 3.7.5
	$(PYENV_ROOT)/versions/2.7.14/bin/pip install neovim
	$(PYENV_ROOT)/versions/3.7.5/bin/pip install neovim
