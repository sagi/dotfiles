cd $(dirname $BASH_SOURCE)
BASE=$(pwd)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv -v ~/.zshrc ~/.zshrc.old 2> /dev/null
ln -sf $BASE/zshrc ~/.zshrc
