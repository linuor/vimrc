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
- Plugin 'tomasr/molokai'                     " molokai color schema
- Plugin 'nathanaelkane/vim-indent-guides'    " visually displaying indent levels in code

Shortcuts
================

Predefined shortcuts
--------------------

- `<leader>` is mapped to `;`
- `cd`                                cd into the direction of current buffer
- `<leader>x`                         toggle window to max/normal

NERDtree
--------

- `<leader>nn`                        to toggle the tree window
- `<leader>nb`                        map to :nerdtreefrombookmark
- `<leader>nf`                        map to :nerdtreefind
- `?`                                 toggle help in tree window
- `o` `O`                             open dir or file
- `x` `X`                             close dir
- `t`                                 open file in tab

Plugin YankRing
---------------

- `<leader>y`                         map to :YRShow
- `<c-s>`                             pre yanked item, **NOTICE**
- `<c-g>`                             next yanked item

CtrlpBuffer
-----------

- `<C-T>`                             map to :CtrlpBuffer
- `<C-F>` `<C-B>`                     shift between modes in ctrlp window
- `<C-J>` `<C-K>`                     move up and down in ctrlp window

TagBar
------

- `<leader>tt`                        map to :TagbarToggle
- `?`                                 toggle help in tagbar window
- `<CR>`                              Jump to tag definition
- `p`                                 As above, but stay in Tagbar window
- `P`                                 Show tag in preview window
- `<C-N>`                             Go to next top-level tag
- `<C-P>`                             Go to previous top-level tag
- `<Space>`                           Display tag prototype
- `v`                                 Hide non-public tags
- `+`                                 Open fold
- `-`                                 Close fold
- `o`                                 Toggle fold
- `*`                                 Open all folds
- `=`                                 Close all folds
- `zj`                                Go to next fold
- `zk`                                Go to previous fold
- `s`                                 Toggle sort
- `c`                                 Toggle autoclose option
- `x`                                 Zoom window in/out
- `q`                                 Close window

vim-surround
------------

```
  Old text                  Command     New text ~
  "Hello *world!"           ds"         Hello world!
  [123+4*56]/2              cs])        (123+456)/2
  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
  if *x>3 {                 ysW(        if ( x>3 ) {
  my $str = *whee!;         vllllS'     my $str = 'whee!';
```

multi-cursor
------------

- `<C-N>`                             next one
- `<C-P>`                             prev one
- `<C-X>`                             ignore one

xptemplage
----------

triggered by super tab already.

easy-motion
-----------

`<Leader><Leader>w`                 to trigger the word motion |w|.

indent-motion
-------------

`<leader>]` `<leader[>`             forward and backward

emmet
-----

- `<C-Y>,`                            Expand Abbreviation
- `v_<C-Y>,`                          Wrap with Abbreviation

Ack
---

`:Ack[!] [options] {pattern} [{directory}]`

nerd-commentor
--------------

- `<leader>cc`                      comment a line
- `<leader>c$`                      comment to the end of line
- `<leader>c<space>`                toggle comment

vim-indent-guides
-----------------

`<leader>i`                         toggle indent guides
