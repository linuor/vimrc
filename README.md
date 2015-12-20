vimrc
=======

linuor's vimrc files.

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
- Plugin 'bling/vim-airline'                  " status/tabline for vim
- Plugin 'aceofall/gtags.vim'                 " Integrates GNU GLOBAL source code tag system with VIM
- Plugin 'scrooloose/nerdtree'                " Tree explorer
- Plugin 'vim-scripts/YankRing.vim'           " Maintains a history of previous yanks, changes and deletes
- Plugin 'mbbill/undotree'                    " The ultimate undo history visualizer for VIM
- Plugin 'kien/ctrlp.vim'                     " Fuzzy file, buffer, mru, tag, etc finder.
- Plugin 'tpope/vim-surround'                 " Modify surroundings
- Plugin 'terryma/vim-multiple-cursors'       " Sublime Text style multiple selections for Vim
- Plugin 'Lokaltog/vim-easymotion'            " An easy way to jump to a word
- Plugin 'vim-scripts/indent-motion'          " Vim motions to the start and end of the current indentation-delimited block
- Plugin 'vim-scripts/matchit.zip'            " extended % matching for HTML, LaTeX, and many other languages
- Plugin 'mattn/emmet-vim'                    " expanding abbreviation like zen-coding.
- Plugin 'mileszs/ack.vim'                    " run ack (a better grep) from vim, and shows the results in a split window
- Plugin 'scrooloose/nerdcommenter'           " plugin for intensely orgasmic commenting
- Plugin 'Townk/vim-autoclose'                " Inserts matching bracket, paren, brace or quote
- Plugin 'nathanaelkane/vim-indent-guides'    " visually displaying indent levels in code
- Plugin 'Valloric/YouCompleteMe'             " A code-completion engine for Vim
- Plugin 'rdnetto/YCM-Generator'              " Generates config files for YouCompleteMe
- Plugin 'SirVer/ultisnips'                   " The ultimate snippet solution for Vim.
- Plugin 'honza/vim-snippets'                 " Code snippets.
- Plugin 'sukima/xmledit'                     " XML/HTML tags will be completed automatically
- Plugin 'tpope/vim-repeat'                   " enable repeating supported plugin maps with '.'
- Plugin 'tpope/vim-fugitive'                 " a Git wrapper
- Plugin 'airblade/vim-gitgutter'             " shows a git diff in the 'gutter' (sign column)
- Plugin 'vim-scripts/DoxygenToolkit.vim'     " Simplify Doxygen documentation in C, C++, Python.
- Plugin 'altercation/vim-colors-solarized'   " solarized color schema

Shortcuts
================

Predefined shortcuts
--------------------

`<leader>` is mapped to `;`

````
" Useful Shortcut {
    " Move around splits
    map <C-J> <C-W>j                        " to below split
    map <C-K> <C-W>k                        " to above split
    nmap <c-h> <c-w>h                       " to left split
    nmap <c-l> <c-w>l                       " to right split

    " Tab
    map <C-t><C-t> :tabnew<CR>              " new tab
    map <C-t><C-w> :tabclose<CR>            " close tab

    " Bash like keys for the command line
    cnoremap <C-A> <Home>
    cnoremap <C-E> <End>
    cnoremap <C-K> <C-U>

    " <leader>pp toggles paste mode
    nmap <leader>pp :set paste!<BAR>set paste?<CR>

    " allow multiple indentation/deindentation in visual mode
    vnoremap < <gv
    vnoremap > >gv

    " cd change working directory to that of the current file
    map cd :lcd %:p:h<CR>

    " Writing Restructured Text (Sphinx Documentation)
    " Ctrl-u 1: underline Parts w/ #'s
    noremap <C-u>1 yyPVr#yyjp
    inoremap <C-u>1 <esc>yyPVr#yyjpA
    " Ctrl-u 2: underline Chapters w/ *'s
    noremap <C-u>2 yyPVr*yyjp
    inoremap <C-u>2 <esc>yyPVr*yyjpA
    " Ctrl-u 3: underline Section Level 1 w/ ='s
    noremap <C-u>3 yypVr=
    inoremap <C-u>3 <esc>yypVr=A
    " Ctrl-u 4: underline Section Level 2 w/ -'s
    noremap <C-u>4 yypVr-
    inoremap <C-u>4 <esc>yypVr-A
    " Ctrl-u 5: underline Section Level 3 w/ ^'s
    noremap <C-u>5 yypVr^
    inoremap <C-u>5 <esc>yypVr^A

    " Coding Shortcut
    " Ctrl-[ jump out of the tag stack (undo Ctrl-])
    "map <C-[> <ESC>:po<CR>
" }
````

airline
-------

`<leader>N` switch to tab N, N could be 1-9.

gtags
-----

````
nmap <leader>qo :copen<CR>
nmap <leader>qc :cclose<CR>
nmap <leader>qg :Gtags<SPACE>
nmap <leader>qf :Gtags -f %<CR>
nmap <leader>qn :cn<CR>
nmap <leader>qp :cp<CR>
nmap <leader>g :GtagsCursor<CR>
````

NERDtree
--------

- `<leader>nn` to toggle the tree window
- `<leader>nb` map to :nerdtreefrombookmark
- `<leader>nf` map to :nerdtreefind
- `m` modify nodes, to create, rename, delete file or direction
- `?` toggle help in tree window
- `o` `O` open dir or file
- `x` `X` close dir
- `t` open file in tab
- 'R' Refresh tree window

YankRing
---------------

- `<leader>yy`                         map to :YRShow
- `<leader>yp`                         prev yanked item
- `<leader>yn`                         next yanked item

undotree
--------

`<leader>u`                             toggle undotree

Ctrlp
-----

- `<C-P>`                             map to :Ctrlp
- `<C-F>` `<C-B>`                     shift between modes in ctrlp window
- `<C-J>` `<C-K>`                     move up and down in ctrlp window

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

easy-motion
-----------

`<Leader><Leader>w`                 to trigger the word motion |w|.
`<Leader><Leader>f`                 to trigger the word motion |f|.

indent-motion
-------------

`<leader>]` `<leader[>`             forward and backward depends on indent level.

matchit
-------

`%` extended % matching for HTML, LaTeX, and many other languages

emmet
-----

- `<C-Y>` and `,`                            Expand Abbreviation
- `v_<C-Y>` and `,`                          Wrap with Abbreviation

Ack
---

`:Ack[!] [options] {pattern} [{directory}]`

nerd-commentor
--------------

- `<leader>c<space>`                toggle comment
- `<leader>cc`                      comment a line
- `<leader>c$`                      comment to the end of line

vim-autoclose
-------------

`<leader>ac` toggle AutoClose on and off
`v_<leader>a` and `"` wrap the selection with `"`

vim-indent-guides
-----------------

`<leader>i`                         toggle indent guides

YouCompleteMe
-------------

YCM-Generator
-------------

ultisnips
---------

With many common code snippets, there are also:

- `c)` for copyright text
- `date` for `strftime("%Y-%m-%d")`
- `ddate` for `strftime("%B %d, %Y")`
- `time` for `strftime("%H:%M")`
- `datetime` for `strftime("%Y-%m-%d %H:%M")`
- `lorem` for lorem string

vim-fugitive
------------

DoxygenToolkit
--------------

- `:Dox` generate comment for function and class.
- `:DoxAuthor` generate author comment.

