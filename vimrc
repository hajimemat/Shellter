scriptencoding utf-8 " 設定ファイルの文字コードを宣言

" Shellterを利用
let g:nora_vim_source_path = '~/.shellter/vim/'
let g:var_dir = get(g:,'var_dir', '~/.shellter/var/vim')

execute expand('source '.g:nora_vim_source_path.'/vimrc')
