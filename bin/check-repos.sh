#!/bin/bash
REPOS=("zsh" "tmux" "vim" "i3")
for name in ${REPOS[@]}
do
    (cd ~/.shellter/repos/$name && git status)
done
