#!/bin/bash

cd $(dirname $BASH_SOURCE)
BASE=$(pwd)

mkdir -p ~/.vim/autoload
curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
ln -sf $BASE/vimrc ~/.vimrc

vim +PlugInstall +qall
