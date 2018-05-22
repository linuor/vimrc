.. Copyright © 2017 linuor. All Rights Reserved.

##############
linuor's vimrc
##############

Less configuration, more defaults.

Mainly focus on C/C++ and restructuredText.

***********
Requirement
***********

- vim with python3 support
- git
- `GNU global <https://www.gnu.org/software/global/>`_ ,
  `pygments <http://pygments.org/>`_ is recommanded.
- `ripgrep <https://github.com/BurntSushi/ripgrep>`_
- `clang-format <https://clang.llvm.org/docs/ClangFormat.html>`_

*******
Install
*******

Firstly, install all the modules required such as git, clang-format, etc.
Then run bash commands as below::

    git clone https://github.com/linuor/vimrc.git vimrc
    cd vimrc
    ./install.sh
    cd ~/.vim/bundle/YouCompleteMe/
    ./install.py --clang-completer

Remember to alias vi to vim, and  export enviroment variables if pygments is
installed too,::

    alias vi="vim"
    export GTAGSLABEL='native-pygments'
    export GTAGSCONF='/usr/local/share/gtags/gtags.conf'

Modify the vimrc file, such as adding email, just search "CUSTOM".

*******
Plugins
*******

Vendor plugins as follow will be installed, including "junegunn/vim-plug":

- Plug 'tpope/vim-commentary' " comment stuff out
- Plug 'tpope/vim-surround'   " Modify surroundings
- Plug 'tpope/vim-repeat'     " enable supported plugin maps with '.'
- Plug 'godlygeek/tabular'    " text filtering and alignment
- Plug 'SirVer/ultisnips'     " The ultimate snippet solution for Vim
- Plug 'honza/vim-snippets'   " Code snippets
- Plug 'airblade/vim-gitgutter'   " shows a git diff in the sign column
- Plug 'tpope/vim-fugitive'   " git wrapper
- Plug 'ludovicchabant/vim-gutentags'   " tag files management
- Plug 'rhysd/vim-clang-format'   " plugin for clang-format
- Plug 'vim-scripts/DoxygenToolkit.vim' " Simplify Doxygen documentation
- Plug 'vim-scripts/DrawIt'   " Ascii drawing
- Plug 'vim-voom/VOoM'        " Vim Outliner of Markers
- Plug 'vim-scripts/Unicode-RST-Tables' " restructuredText table helper
- Plug 'Valloric/YouCompleteMe'   " code-completion engine
- Plug 'Shougo/denite.nvim'   " asynchronous unite all interfaces

*********
Shortcuts
*********

Predefined shortcuts
====================

Shortcuts are defined as follow::

    let mapleader="\<Space>"
    " mute search high light before clear and redraw the screen
    nnoremap <silent> <C-L>
                \ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
    " hight tailing space
    nnoremap <leader>sp /\s\+$<CR>
    " undo in insert mode
    inoremap <C-U> <C-G>u<C-U>

    " shortcut for navation
    " args
    nnoremap [a :previous<CR>
    nnoremap ]a :next<CR>
    nnoremap [A :first<CR>
    nnoremap ]A :last<CR>
    " buffers
    nnoremap [b :bprevious<CR>
    nnoremap ]b :bnext<CR>
    nnoremap [B :bfirst<CR>
    nnoremap ]B :blast<CR>
    " locations
    nnoremap [l :lprevious<CR>
    nnoremap ]l :lnext<CR>
    nnoremap [L :lfirst<CR>
    nnoremap ]L :llast<CR>
    " quick fix
    nnoremap [q :cprevious<CR>
    nnoremap ]q :cnext<CR>
    nnoremap [Q :cfirst<CR>
    nnoremap ]Q :clast<CR>
    " tabs
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

    " silent grep, keep the QuickFix window open, and not jump to first match
    command! -nargs=+ MyGrep execute 'silent grep! <args>' | copen
    nnoremap <leader><leader>g :MyGrep<Space>

netrw
=====

netrw is released with every vim, we use it as default file explorer.

- ``-`` Go up directory.
- ``%`` Create new file.
- ``d`` Create new directory.
- ``D`` Delete file or directory.
- ``R`` Rename.
- ``c`` Make the directory under the cursor to be the current directory.
- ``gh`` Toggle hiden/unhide of dot-files.
- ``gn`` Make directory under the cursor to be the top of the tree.
- ``i`` Cycle betwnn thin, long, wide, and tree listings.
- ``s`` Select sorting style: by name, time, or file size.
- ``t`` Enter the file/directory under the cursor in a new tab.

matchit
=======

matchit also released with every vim, it extends ``%`` matching for HTML, LaTeX,
and many other languages.

vim-commentary
==============

``gcc`` to toggle commentary

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

tabular
=======

Press ``<leader>a`` then given a ``,`` , will make codes align base on ``,`` .
This shortcut is available under normal and visual mode.

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

gitgutter
=========

- jump to next hunk (change): ``]c``
- jump to previous hunk (change): ``[c``
- stage the hunk with ``<Leader>hs``
- undo it with ``<Leader>hu``
- preview a hunk's changes with ``<Leader>hp``

The ``.`` command will work with both these with the help of repeat.vim.

A hunk text object is provided which works in visual and operator-pending modes.

``ic`` operates on all lines in the current hunk.
``ac`` operates on all lines in the current hunk and any trailing empty lines.

vim-fugitive
============

- ``Gstatus`` to get ``git status`` info, and use ``-`` to add/reset files.
- ``Gcommit`` to commit.
- ``Gpush``   to push.
- ``Gpull`` to pull.
- ``Gdiff`` to diff.

gutentags
=========

use ``<leader>gd`` to toggle auto tags disable/enable.

vim-clang-format
================

Use ``<leader>cf`` to format the whole/selected source. This shortcut is
available for both normal and visual mode. 

A ``.clang-format`` file is needed. Place one in the project root.

DoxygenToolkit
==============

- ``:Dox`` generate comment for function and class.
- ``:DoxAuthor`` generate author comment. Use ``tpl`` snippet instead.

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

YouCompleteMe
=============

Usually, the following shortcuts are usefual::

    let g:ycm_key_invoke_completion='<C-\>'
    nnoremap <leader>yg :YcmCompleter GoTo<CR>
    nnoremap <leader>yf :YcmCompleter FixIt<CR>
    nnoremap <leader>yd :YcmDiags<CR>

denite
======

Use ``<leader>df`` to quickly open file.

***************
TODOs and DONEs
***************

TODOs
=====

- outline for the current buffer.
- template for new c/c++ header/source files, namespace, include guard, etc.
- language server protocol

DONEs
=====

- 2018-05-22
    - restructure the whole vimrc.
    - update README

