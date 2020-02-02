# Shellter

`Shell And Terminal is the Perfect Shellter.`

Shellに引きこもりたい。
引きこもるなら快適にしたい。

## 導入

```
cd
  
git clone https://github.com/hajimemat/shellter.git .shellter
cd .shellter

# FZFをインストールする
make fzf.makefile

# zshプラグイン
git clone https://github.com/zsh-users/zsh-completions.git ~/.shellter/var/repo/zsh-completions      
git clone --recursive https://github.com/sorin-ionescu/prezto.git /.shellter/var/repo/zprezto

# python
git clone https://github.com/pyenv/pyenv.git ~/.pyenv                           
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv                 
source ~/.shellter/nvim.profile.sh
pyenv install 2.7.14 
pyenv install 3.7.5   
$PYENV_ROOT/versions/2.7.14/bin/pip install neovim
$PYENV_ROOT/versions/3.7.5/bin/pip install neovim   

make zsh git vim tmux
```


## Status

開発開始段階

## 構想

* zsh
* tmux
* vim
* fzf
* git

### FZFを有効活用する
### Tmuxを飛び回る
### Gitを飛び回る

