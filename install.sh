#!/bin/sh

VIMHOME=~/.vim
VIMFILE=~/.vimrc
PWD=$(cd $(dirname $0); pwd)

echo "Installing linuor/vimrc from: $PWD ..."
# backup exists file/dir
echo "Backup old configurations ..."
for f in $VIMHOME $VIMFILE; do
    if [ -e "$f" ]; then
        if [ -e "${f}_bak" ]; then
            rm -rf ${f}_bak || error "Can't remove exists backup file: ${f}_bak"
        fi
        mv $f ${f}_bak || error "Can't rename exists file: $f"
    fi
done
# link the files
echo "Create symbol links ..."
ln -sf $PWD $VIMHOME
ln -sf $PWD/vimrc $VIMFILE
echo "Create temp direcotry ..."
mkdir $PWD/temp
mkdir $PWD/temp/undo
echo "Clone from https://github.com/gmarik/Vundle.vim.git ..."
mkdir bundle
git clone https://github.com/gmarik/Vundle.vim.git bundle/Vundle.vim
echo "Install other bundles..."
vi +PluginInstall
