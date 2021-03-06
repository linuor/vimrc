.. Copyright © 2017 linuor. All Rights Reserved.

##############
linuor's vimrc
##############

Less configuration, more defaults.

Mainly focus on C++ and restructuredText.

***********
Requirement
***********

- vim 8.0 or later, with python3 support
- git
- `GNU global <https://www.gnu.org/software/global/>`_ ,
  `pygments <http://pygments.org/>`_ is recommanded.
- `ripgrep <https://github.com/BurntSushi/ripgrep>`_
- `clangd <https://clang.llvm.org/extra/clangd>`_ version 9.0.0 or later

*******
Install
*******

Firstly, install all the modules required such as git, clangd, etc.
Then run bash commands as below::

    git clone https://github.com/linuor/vimrc.git vimrc
    cd vimrc
    ./install.sh

Remember to alias vi to vim, and  export enviroment variables if pygments is
installed too::

    alias vi="vim"
    export GTAGSLABEL='native-pygments'
    export GTAGSCONF='/usr/local/share/gtags/gtags.conf'
    export FZF_DEFAULT_COMMAND='rg --files'

Modify the vimrc file, provides a full path of clang-format.py,
and informations such as author and email, just search "CUSTOM".

*******
Plugins
*******

Plugins as follow will be installed:

- `vim-commentary <https://github.com/tpope/vim-commentary>`_
  comment stuff out
- `vim-surround <https://github.com/tpope/vim-surround>`_
  Modify surroundings
- `vim-repeat <https://github.com/tpope/vim-repeat>`_
  enable supported plugin maps with '.'
- `tabular <https://github.com/godlygeek/tabular>`_
  text filtering and alignment
- `ultisnips <https://github.com/SirVer/ultisnips>`_
  The ultimate snippet solution for Vim
- `vim-snippets <https://github.com/honza/vim-snippets>`_
  Code snippets
- `vim-gitgutter <https://github.com/airblade/vim-gitgutter>`_
  git diff in the sign column
- `vim-fugitive <https://github.com/tpope/vim-fugitive>`_
  git wrapper
- `DoxygenToolkit.vim <https://github.com/vim-scripts/DoxygenToolkit.vim>`_
  Doxygen documentation
- `DrawIt <https://github.com/vim-scripts/DrawIt>`_
  Ascii drawing
- `VOoM <https://github.com/vim-voom/VOoM>`_
  Vim Outliner of Markers
- `Unicode-RST-Tables <https://github.com/vim-scripts/Unicode-RST-Tables>`_
  rst table helper
- `coc.nvim <https://github.com/neoclide/coc.nvim>`_
  code-completion engine
- `ListToggle <https://github.com/Valloric/ListToggle>`_
  toggle quick fix and location list
- `gruvbox <https://github.com/morhetz/gruvbox>`_
  color scheme
- `ucmake.vim <https://github.com/linuor/ucmake.vim>`_
  A vim helper for cmake build system.
- `ugtags.vim <https://github.com/linuor/ucmake.vim>`_
  A automation vim plugin for GNU global tag system.

Besides, another 2 plugins has already installed:

- ``matchit.vim`` which released by vim.
- ``gtags.vim`` which installed with GNU global.

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
    " hightlight tailing space
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
    " there are also [c ]c for jumping between git hunks

    " Bash like keys for the command line
    cnoremap <C-A> <Home>
    cnoremap <C-E> <End>

    " retain visual selection after indention
    vnoremap < <gv
    vnoremap > >gv

    " auto close pairs
    inoremap ( ()<Left>
    inoremap [ []<Left>
    inoremap { {}<Left>
    inoremap < <><Left>
    inoremap " ""<Left>
    inoremap ' ''<Left>
    inoremap ` ``<Left>

    " always use :update not :write
    nnoremap <leader>u :update<cr>

netrw
=====

netrw is released with every vim, we use it as the default file explorer.
Use ``:E`` to activate it in the current window.

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

``gcc`` to toggle commentary.

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

With many common code snippets, such as:

- ``c)`` for copyright text.
- ``date`` for ``strftime("%Y-%m-%d")`` .
- ``datetime`` for ``strftime("%Y-%m-%d %H:%M")`` .
- ``time`` for ``strftime("%H:%M")`` .
- ``lorem`` for lorem string.
- ``box`` and ``bbox`` for nice box.

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

- ``:Gstatus`` to get ``git status`` info, and use ``-`` to add/reset files.
- ``:Gcommit`` to commit.
- ``:Gpush``   to push.
- ``:Gpull`` to pull.
- ``:Gdiff`` to diff.

gtags
=====

We use gtags-cscope to replace the build in cscope.
Just use the ``:cscope`` as usual. Notice that ``:cs find d`` command is not
implemented by gtags-cscope.

``:Gtags`` can be used to invoke the global command. Also the the following
shortcuts are provided:

- ``<leader>gl`` list all the tags of the current file
- ``<leader>gd`` goto the definition of the symbol under the cursor
- ``<leader>gr`` list all the reference of the symbol under the cursor
- ``<leader>gi`` jump to files including the current file
- ``<leader>gf`` jump to files under the cursor
- ``<leader>gg`` jump to definition or reference under the cursor

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

- ``<leader><leader>c`` Creates a new restructuredText table.
- ``<leader><leader>f`` Fix table columns in a table.

coc.nvim
========

- ``<tab>`` trigger the auto completion in insert mode 
- ``<leader>cd`` goto declaration
- ``<leader>ci`` goto definition/implementation
- ``<leader>cr`` goto reference
- ``<leader>fs`` format the selected text in insert mode,
  or the following text object.
- ``<leader>fa`` format the whole buffer
- ``<leader>fx`` apply the fix-it
- ``<leader>rf`` refector
- ``<leader>rn`` rename
- ``<leader>ff`` file search list
- ``<leader>fb`` buffer search list
- ``<leader>sh`` grep search list

NeoMake
=======

auto lint.

ListToggle
==========

ListToggle provides ``<leader>q`` and ``<leader>l`` to toggle quickfix and
location list.

Tips
----

- launch vim from the root of the project.
- pass a list of files as arguments for vim, such as ``vim `git ls-files``` ,
  to open all the source files of the project.
- to search files from the project root, use ``<leader>fb`` to search buffers.
- to recursively search files from the current location, use ``<leader>ff`` .
- use both coc.nvim list and gtags to jump across the project.

***************
TODOs and DONEs
***************

DONEs
=====

- 2018-06-12
    - lint and show the result in a list. YouCompleteMe provides this,
      which is mapped to ``<leader>yd`` .
- 2018-05-22
    - restructure the whole vimrc.
    - update README
- 2018-05-23
    - outline for the current buffer.
    - related file, header file, implementation file, test file
- 2018-05-24
    - toggle Quickfix window
- 2018-05-26
    - template for new c/c++ header/source files, namespace, include guard, etc.
    - better automatic tag file manager.
- 2018-12-2
    - vim-clang-format too slow, use clangformat.py instead.
- 2019-02-18
   - denite is too heavy, and break when update. Remove it and use ``fzf``
     instead.
   - YouCompleteMe is a little lag while linting, ALE may be a alternation.
     ALE is not my style, use neomake instead.

DENYs
=====

- gtags outline source for Denite. Using outline means we don't know much about
  the name. Navigation is better than filtering. So, keep the QuickFix style,
  but drop the filtering style. Just use ``<leader>gl`` .
- run make in the build dir. Use ``make -C /path/to/makefile`` .
  ucmake.vim auto set build dir for ``make`` .

TODOs
=====

- language server protocol.
- add sources for fzf.
- use neomake to replace ucmake.vim and ugtags.vim
- neoformat may be useful for formating kinds of files.
