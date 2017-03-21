vimrc
=======

linuor's vimrc files.
Less configuration, more vim defaults.

Requirement
===========

- git
- GNU global
- ack

Usage
=====

Firstly, install git, GNU global and ack.

```
git clone https://github.com/linuor/vimrc.git vimrc
cd vimrc
./install.sh
```

Plugin
======

- Plugin 'gmarik/Vundle.vim'                  " Plugin manage
- Plugin 'Shougo/unite.vim'                   " Unite and create user interfaces
- Plugin 'tpope/vim-surround'                 " Modify surroundings
- Plugin 'vim-scripts/matchit.zip'            " extended % matching for HTML, LaTeX, and many other languages
- Plugin 'mileszs/ack.vim'                    " run ack (a better grep) from vim, and shows the results in a split window
- Plugin 'tpope/vim-commentary'               " comment stuff out.
- Plugin 'Valloric/YouCompleteMe'             " A code-completion engine for Vim
- Plugin 'rdnetto/YCM-Generator'              " Generates config files for YouCompleteMe
- Plugin 'SirVer/ultisnips'                   " The ultimate snippet solution for Vim.
- Plugin 'honza/vim-snippets'                 " Code snippets.
- Plugin 'sukima/xmledit'                     " XML/HTML tags will be completed automatically
- Plugin 'tpope/vim-repeat'                   " enable repeating supported plugin maps with '.'
- Plugin 'airblade/vim-gitgutter'             " shows a git diff in the 'gutter' (sign column)
- Plugin 'vim-scripts/DoxygenToolkit.vim'     " Simplify Doxygen documentation in C, C++, Python.
- Plugin 'rhysd/vim-clang-format'             " plugin for clang-format, a formatter for C, C++ and Obj-C code
- Plugin 'godlygeek/tabular'                  " script for text filtering and alignment
- Plugin 'vim-scripts/DrawIt'                 " Ascii drawing plugin: lines, ellipses, arrows, fills, and more!
- Plugin 'vim-scripts/VOoM'                   " Vim Outliner of Markers
- Plugin 'vim-scripts/Unicode-RST-Tables'     " Allows to create and edit restructuredText tables easily (Unicode and Python 3).

Shortcuts
================

Predefined shortcuts
--------------------

```
" retain visual selection after indention
vnoremap < <gv
vnoremap > >gv

" cd change working directory to that of the current file
noremap cd :lcd %:p:h<CR>
```

netrw
-----

netrw is released with every vim, we use it as default file explorer.

- `-` Go up directory
- `%` Create new file
- `c` Make the directory under the cursor to be the current directory
- `d` Create new directory
- `D` Delete file or directory
- `gh` Toggle hiden/unhide of dot-files
- `gn` Make directory under the cursor to be the top of the tree
- `i` Cycle betwnn thin, long, wide, and tree listings
- `R` Rename
- `s` Select sorting style: by name, time, or file size
- `t` Enter the file/directory under the cursor in a new tab

unite.vim
---------

TODO

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

matchit
-------

`%` extended % matching for HTML, LaTeX, and many other languages

Ack
---

`:Ack[!] [options] {pattern} [{directory}]`

vim-commentary
--------------

`gcc` to toggle commentary

YCM-Generator
-------------

`:YcmGenerateConfig` generate a config file for the current directory
`:CCGenerateConfig`  generate a config file for the current directory

ultisnips
---------

With many common code snippets, there are also:

- `c)` for copyright text
- `date` for `strftime("%Y-%m-%d")`
- `ddate` for `strftime("%B %d, %Y")`
- `time` for `strftime("%H:%M")`
- `datetime` for `strftime("%Y-%m-%d %H:%M")`
- `lorem` for lorem string

Also, new snippets are provided, which located in directory `my_snippets/` :

- `my_snippets/rst.snippets` For rst files, and provides `tpl` for new rst.

DoxygenToolkit
--------------

- `:Dox` generate comment for function and class.
- `:DoxAuthor` generate author comment.

vim-clang-format
----------------

use `<leader>cf` to toggle auto format or not.

Tabularize
----------

Press `<leader>a` then a `,` or something like that, will make align.

- `nmap <Leader>a :Tabularize /`
- `vmap <Leader>a :Tabularize /`

Draw-it
-------

`<leader>di` to strat draw, and `<leader>ds` to stop.

VOom
----

- For a Markdown file: `:Voom markdown`
- For LaTeX file: `:Voom latex`
- For an Orgmode file: `:Voom org`

`<Tab>` is used after `:Voom` for auto-completion

Unicode-RST-Tables
------------------

- `<Leader><Leader>c` Creates a new restructuredText table.
- `<Leader><Leader>f` Fix table columns in a table.
