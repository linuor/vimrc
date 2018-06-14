#!/bin/sh

VIMHOME=~/.vim
VIMFILE=~/.vimrc
PWD=$(cd $(dirname $0); pwd)
PKG=$VIMHOME/pack/my/start
echo
echo "Installing linuor/vimrc from: $PWD ..."
echo "Backup old configurations ..."
for f in $VIMHOME $VIMFILE; do
    if [ -e "$f" ]; then
        if [ -e "${f}_bak" ]; then
            rm -rf ${f}_bak || error "Can't remove former backup file ${f}_bak"
        fi
        mv $f ${f}_bak || error "Can't rename file $f to ${f}_bak"
    fi
done

# link the files
echo "Create symbol links..."
ln -sf $PWD $VIMHOME
ln -sf $PWD/vimrc $VIMFILE
echo "Create temp direcotries..."
mkdir $PWD/temp
mkdir $PWD/temp/undo

# link the gtags.vim from GNU global
if [ -z ${GTAGSCONF+x} ]; then
    echo '$GTAGSCONF is unset, gtags.vim is not linked to package directory.' 
    echo "Find a gtags.vim and place it in $PKG/gtags/plugin/, or find the "
    echo 'full path of gtags.conf and export to $GTAGSCONF then re-install.'
else
    echo "Linking gtags.vim to package directory..."
    mkdir -p $PKG/gtags/plugin
    ln -sf ${GTAGSCONF%/*.*}/gtags.vim $PKG/gtags/plugin/
fi

echo 'Update plugins...'
git submodule update --init --recursive

echo 'Compile YouCompleteMe...'
cd $PKG/YouCompleteMe
./install.py --clang-completer

echo "vim is about to launch to generate helptags."
echo "Just quit vim to finish the installaion."
read -n 1 -s -r -p " Press any key to continue..."
vim +'helptags ALL'

echo
echo "Installation complete"
echo "Remember to alias vi to vim and export enviroment variables as follow:"
echo
echo '    alias vi="vim"'
echo '    export GTAGSLABEL="native-pygments"'
echo '    export GTAGSCONF="/usr/local/share/gtags/gtags.conf"'
echo

