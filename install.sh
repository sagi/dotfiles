#!/bin/bash

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

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
  ./ubuntu-install.sh
fi

echo "# Installing FZF"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all


echo "# Installing NVM"

LATEST_NVM_RELEASE=$(get_latest_release nvm-sh/nvm)
NVM_INSTALL_URL="https://raw.githubusercontent.com/nvm-sh/nvm/$LATEST_NVM_RELEASE/install.sh "
curl -o- $NVM_INSTALL_URL | bash

echo "# Installing oh-my-zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv -v ~/.zshrc ~/.zshrc.old 2> /dev/null
ln -sf $BASE/zshrc ~/.zshrc
