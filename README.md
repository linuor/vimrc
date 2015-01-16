vimrc
=======

linuor's vimrc files.

Usage
=====

```
git clone https://github.com/linuor/vimrc.git vimrc
cd vimrc
./install.sh
```

Plugin
======

- Plugin 'gmarik/Vundle.vim'                  " Plugin manage
- Plugin 'tomtom/tlib_vim'                    " Some utility functions for VIM
- Plugin 'scrooloose/nerdtree'                " Tree explorer
- Plugin 'Townk/vim-autoclose'                " Inserts matching bracket, paren, brace or quote
- Plugin 'tpope/vim-surround'                 " Modify surroundings
- Plugin 'vim-scripts/matchit.zip'            " extended % matching for HTML, LaTeX, and many other languages
- Plugin 'vim-scripts/YankRing.vim'           " Maintains a history of previous yanks, changes and deletes
- Plugin 'terryma/vim-multiple-cursors'       " Sublime Text style multiple selections for Vim
- Plugin 'sukima/xmledit'                     " XML/HTML tags will be completed automatically
- Plugin 'kien/ctrlp.vim'                     " Fuzzy file, buffer, mru, tag, etc finder.
- Plugin 'ervandew/supertab'                  " Perform all your vim insert mode completions with Tab
- Plugin 'drmingdrmer/xptemplate'             " Code snippets engine for Vim, with snippets library.
- Plugin 'vim-scripts/OmniCppComplete'        " C/C++ omni-completion with ctags database
- Plugin 'Lokaltog/vim-easymotion'            " An easy way to jump to a word
- Plugin 'majutsushi/tagbar'                  " browsing the tags of source files ordered by classes
- Plugin 'vim-scripts/indent-motion'          " Vim motions to the start and end of the current indentation-delimited block
- Plugin 'mattn/emmet-vim'                    " expanding abbreviation like zen-coding.
- Plugin 'mileszs/ack.vim'                    " run ack (a better grep) from vim, and shows the results in a split window
- Plugin 'MarcWeber/vim-addon-mw-utils'       " interpret a file by function and cache file automatically
- Plugin 'scrooloose/nerdcommenter'           " plugin for intensely orgasmic commenting
- Plugin 'bling/vim-airline'                  " status/tabline for vim
- Plugin 'tpope/vim-repeat'                   " enable repeating supported plugin maps with '.'
- Plugin 'tpope/vim-fugitive'                 " a Git wrapper
- Plugin 'airblade/vim-gitgutter'             " shows a git diff in the 'gutter' (sign column)

Plugin Shortcuts
================

NERDtree
--------

- `<leader>nn`                        to toggle the tree window
- `<leader>nb`                        map to :nerdtreefrombookmark
- `<leader>nf`                        map to :nerdtreefind

Plugin YankRing
---------------

- `<leader>y`                         map to :YRShow
- `<c-s>`                             pre yanked item
- `<c-g>`                             next yanked item

CtrlpBuffer
-----------

`<C-T>`                             map to :CtrlpBuffer

TagBar
------

`<leader>tt`                        map to :TagbarToggle
