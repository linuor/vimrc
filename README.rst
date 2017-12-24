.. Copyright © 2017 linuor. All Rights Reserved.

##############
linuor's vimrc
##############

Less configuration, more defaults.

***********
Requirement
***********

- git, required
- clang-format, required
- ripgrep, optional
- Exuberant Ctags, optional

*******
Install
*******

Firstly, install all the modules required such as git, clang-format, etc.
Optional modules such as ctags, ripgrep, etc. are recommanded.
Then run bash commands as below::

    git clone https://github.com/linuor/vimrc.git vimrc
    cd vimrc
    ./install.sh
    cd ~/.vim/bundle/YouCompleteMe/
    ./install.py

*******
Plugins
*******

Vendor plugins as follow will be installed:

- Plugin 'gmarik/Vundle.vim' Plugin manage.
- Plugin 'tpope/vim-surround' Modify surroundings.
- Plugin 'tpope/vim-commentary' Comment stuff out.
- Plugin 'Valloric/YouCompleteMe' Code-completion engine.
- Plugin 'SirVer/ultisnips' Ultimate snippet solution for Vim.
- Plugin 'honza/vim-snippets' Code snippets.
- Plugin 'sukima/xmledit' XML/HTML tags will be completed automatically.
- Plugin 'tpope/vim-repeat' Enable repeating supported plugin maps with ``.`` .
- Plugin 'airblade/vim-gitgutter' shows a git diff in the 'gutter' (sign column)
- Plugin 'vim-scripts/DoxygenToolkit.vim' Simplify Doxygen documentation in C,
  C++, Python.
- Plugin 'rhysd/vim-clang-format' Plugin for clang-format.
- Plugin 'godlygeek/tabular' Script for text filtering and alignment
- Plugin 'vim-scripts/DrawIt' Ascii drawing plugin.
- Plugin 'vim-scripts/VOoM' Outliner of markers.
- Plugin 'vim-scripts/Unicode-RST-Tables' Make work with RST tables easily
  (Unicode and Python 3 supported).
- Plugin 'tpope/vim-fugitive' a Git wrapper.
- Plugin 'ctrlpvim/ctrlp.vim' Buffer, mru, tag, etc finder.

*********
Shortcuts
*********

Predefined shortcuts
====================

Shortcuts are defined as follow::

    let mapleader="\<Space>"
    " mute search high light before clear and redraw the screen
    nnoremap <silent> <C-L> :nohlsearch<CR><C-l>
    " hight tailing space
    nnoremap <leader>sp /\s\+$

    " shortcut for navation
    nnoremap [a :previous<CR>
    nnoremap ]a :next<CR>
    nnoremap [A :first<CR>
    nnoremap ]A :last<CR>
    nnoremap [b :bprevious<CR>
    nnoremap ]b :bnext<CR>
    nnoremap [B :bfirst<CR>
    nnoremap ]B :blast<CR>
    nnoremap [l :lprevious<CR>
    nnoremap ]l :lnext<CR>
    nnoremap [L :lfirst<CR>
    nnoremap ]L :llast<CR>
    nnoremap [q :cprevious<CR>
    nnoremap ]q :cnext<CR>
    nnoremap [Q :cfirst<CR>
    nnoremap ]Q :clast<CR>
    nnoremap [t :tabprevious<CR>
    nnoremap ]t :tabnext<CR>
    nnoremap [T :tabfirst<CR>
    nnoremap ]T :tablast<CR>

    " Bash like keys for the command line
    cnoremap <C-A> <Home>
    cnoremap <C-E> <End>

    " retain visual selection after indention
    vnoremap < <gv
    vnoremap > >gv

    " cd change working directory to that of the current file
    nnoremap cd :lcd %:p:h<CR>

netrw
=====

netrw is released with every vim, we use it as default file explorer.

- `-` Go up directory.
- `%` Create new file.
- `d` Create new directory.
- `D` Delete file or directory.
- `R` Rename.
- `c` Make the directory under the cursor to be the current directory.
- `gh` Toggle hiden/unhide of dot-files.
- `gn` Make directory under the cursor to be the top of the tree.
- `i` Cycle betwnn thin, long, wide, and tree listings.
- `s` Select sorting style: by name, time, or file size.
- `t` Enter the file/directory under the cursor in a new tab.

vim-surround
============

vim-surround has the following operations:

+---------------------------+-------------+-------------------------------+
| Old text                  | Command     | New text ~                    |
+===========================+=============+===============================+
| ``"Hello *world!"``       | ``ds"``     | ``Hello world!``              |
+---------------------------+-------------+-------------------------------+
| ``[123+4*56]/2``          | ``cs])``    | ``(123+456)/2``               |
+---------------------------+-------------+-------------------------------+
| ``"Look ma, I'm *HTML!"`` | ``cs"<q>``  | ``<q>Look ma, I'm HTML!</q>`` |
+---------------------------+-------------+-------------------------------+
| ``if *x>3 {``             | ``ysW(``    | ``if ( x>3 ) {``              |
+---------------------------+-------------+-------------------------------+
| ``my $str = *whee!;``     | ``vllllS'`` | ``my $str = 'whee!';``        |
+---------------------------+-------------+-------------------------------+

- ``ys{motion}{mark}`` wrap the text object with ``{mark}``
- ``cs{mark1}{mark2}`` change {mark1} to ``{mark2}``
- ``ds{mark}`` delete ``{mark}``

matchit
=======

``%`` extended ``%`` matching for HTML, LaTeX, and many other languages.

vim-commentary
==============

``gcc`` to toggle commentary

YouCompleteMe
=============

Usually, the following shortcuts are usefual::

    let g:ycm_key_invoke_completion='<C-\>'
    nnoremap <leader>yg :YcmCompleter GoTo<CR>
    nnoremap <leader>yf :YcmCompleter FixIt<CR>
    nnoremap <leader>yd :YcmDiags<CR>

ultisnips
=========

With many common code snippets, there are also:

- ``c)`` for copyright text.
- ``date`` for ``strftime("%Y-%m-%d")`` .
- ``datetime`` for ``strftime("%Y-%m-%d %H:%M")`` .
- ``time`` for ``strftime("%H:%M")`` .
- ``lorem`` for lorem string.

Also, customer snippets are provided, which located in directory
``my_snippets/`` :

- ``my_snippets/rst.snippets`` For rst files
- ``my_snippets/c.snippets`` For C/C++ files

All customer snippets use ``tpl`` to create file skecth.

DoxygenToolkit
==============

- ``:Dox`` generate comment for function and class.
- ``:DoxAuthor`` generate author comment. Use ``tpl`` snippet instead.

vim-clang-format
================

Use `<leader>cf` to format the whole/selected source. This shortcut is available
under normal and visual mode.

Tabularize
==========

Press ``<leader>a`` then given a ``,`` , will make codes align base on ``,`` .
This shortcut is available under normal and visual mode.

Draw-it
=======

``<leader>di`` to strat draw, and ``<leader>ds`` to stop.

VOom
====

- For a Markdown file: ``:Voom markdown``
- For LaTeX file: ``:Voom latex``
- For an Orgmode file: ``:Voom org``

``<Tab>`` could be used after ``:Voom`` for file type auto-completion.

Unicode-RST-Tables
==================

- ``<Leader><Leader>c`` Creates a new restructuredText table.
- ``<Leader><Leader>f`` Fix table columns in a table.

vim-fugitive
============

- ``Gstatus`` to get ``git status`` info, and use ``-`` to add/reset files.
- ``Gcommit`` to commit.
- ``Gpush``   to push.
- ``Gpull`` to pull.
- ``Gdiff`` to diff.


CtrlP
=====

Use ``<C-p>`` to trigger the CtrlP promote. It is change to buffer mode.
Use ``<C-f>`` ``<C-b>`` to toggle between modes, and ``<C-j>`` ``<C-k>`` to
navigate the list items.

