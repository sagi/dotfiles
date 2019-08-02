#!/bin/bash

echo "# Installing VIM"

cd $(dirname $BASH_SOURCE)
BASE=$(pwd)

mkdir -p ~/.vim/autoload
curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
ln -sf $BASE/vimrc ~/.vimrc

vim +PlugInstall +qall

echo "# Installing I3"

mkdir -p ~/.i3 
mv -v ~/.i3/config~/.i3/config.old 2> /dev/null
ln -sf $BASE/i3config ~/.i3/config


OS_RELEASE=$(awk -F= '/^NAME/{print $2}' /etc/os-release)

if [[ $OS_RELEASE = '"Ubuntu"' ]]; then
  echo "# Installing Ubuntu apps"
  ./ubuntu.sh
fi
