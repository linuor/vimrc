#!/bin/sh

VIMHOME=~/.vim
VIMFILE=~/.vimrc
PWD=$(cd $(dirname $0); pwd)
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

echo "vim is about to launch to install plugins."
echo "Just quit after the installaion."
read -n 1 -s -r -p " Press any key to continue..."
vim +"PlugUpgrade | PlugInstall"

echo
echo "Installation complete"
echo "Remember to alias vi to vim and export enviroment variables as follow:"
echo
echo '    alias vi="vim"'
echo '    export GTAGSLABEL="native-pygments"'
echo '    export GTAGSCONF="/usr/local/share/gtags/gtags.conf"'
echo
echo "And compile YouCompleteMe with:"
echo
echo '    ./install.py --clang-completer'
echo

