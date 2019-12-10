scriptencoding utf-8 " 設定ファイルの文字コードを宣言

" Shellterを利用
let g:nora_vim_source_path = '~/.shellter/vim/'
let g:var_dir = get(g:,'var_dir', '~/.shellter/var/vim')

" pyenvを利用
let g:python_host_prog = expand('~/.pyenv/versions/2.7.14/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/3.6.7/bin/python')

execute expand('source '.g:nora_vim_source_path.'/vimrc')
