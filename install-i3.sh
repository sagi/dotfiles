cd $(dirname $BASH_SOURCE)
BASE=$(pwd)
mkdir -p ~/.i3
mv -v ~/.i3/config~/.i3/config.old 2> /dev/null
ln -sf $BASE/i3config ~/.i3/config
