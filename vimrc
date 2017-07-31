" linuor's vimrc files.
" Less configuration, more defaults.

" Bundles {
    set nocompatible
    filetype off   " required by vundle
    set rtp+=$HOME/.vim/bundle/Vundle.vim   " required by vundle
    call vundle#begin()
        Plugin 'gmarik/Vundle.vim'              " Plugin manage
        Plugin 'tpope/vim-surround'             " Modify surroundings
        Plugin 'tpope/vim-commentary'           " comment stuff out.
        Plugin 'Valloric/YouCompleteMe'         " A code-completion engine for Vim
        Plugin 'SirVer/ultisnips'               " The ultimate snippet solution for Vim.
        Plugin 'honza/vim-snippets'             " Code snippets.
        Plugin 'sukima/xmledit'                 " XML/HTML tags will be completed automatically
        Plugin 'tpope/vim-repeat'               " enable repeating supported plugin maps with '.'
        Plugin 'airblade/vim-gitgutter'         " shows a git diff in the 'gutter' (sign column)
        Plugin 'vim-scripts/DoxygenToolkit.vim' " Simplify Doxygen documentation in C, C++, Python.
        Plugin 'rhysd/vim-clang-format'         " plugin for clang-format, a formatter for C, C++ and Obj-C code
        Plugin 'godlygeek/tabular'              " script for text filtering and alignment
        Plugin 'vim-scripts/DrawIt'             " Ascii drawing plugin: lines, ellipses, arrows, fills, and more!
        Plugin 'vim-scripts/VOoM'               " Vim Outliner of Markers
        Plugin 'vim-scripts/Unicode-RST-Tables' " Allows to create and edit restructuredText tables easily (Unicode and Python 3).
        Plugin 'tpope/vim-fugitive'             " a Git wrapper
    call vundle#end()
    " required by vundle, turn on filetype plugin indent
    filetype plugin indent on

    " enable plugins released with Vim
    runtime macros/matchit.vim
" }

" General {
    set history=1000   " lines of history Vim has to remember

    set autoread   " auto read when a file is changed from the outside

    set lazyredraw   " don't redraw while executing macros, better performance

    set hidden   " hidden dirty buffers when abandoned

    set nojoinspaces   " insert only one space after '.' on J

    set backspace=indent,eol,start   " allow <BS> to delete everything

    set whichwrap+=b   " allow <BS> to move to next/prev line

    set report=0   " always report number of lines changed
" }

" UserInterface {
    set winminwidth=0 " min width of a window to 0 so we can maximize others
    set winminheight=0 " min height of a window to 0 so we can maximize others

    if has("gui_running")
        set mouse=a   " Enable mouse for all modes in gui,
        set mousehide   " Hide the mouse cursor while typing
    else
        set mouse=n   " Enable mouse for normal mode only.
    endif

    set laststatus=2   " Always show status line

    set scrolloff=3   " set lines to the top/bottom of the buffer

    if has('cmdline_info')
        set ruler   " Show the ruler
        set showcmd     "Show partial commands the last line of screen
    endif

    set number relativenumber   " Show line number with relative number

    set colorcolumn=80  " Highligh coloum

    set cmdheight=2   " Height of the command bar, avoid hit-enter prompts

    set hlsearch   " Highlight search results

    set matchtime=1   " Tenths of a second to show the matching paren

    set cursorline   " Highlight current line

    set splitright   " Place new vsplit to the right
    set splitbelow   " Place new split to the bottom

    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=

    " Set extra options when running in GUI mode
    if has("gui_running")
        set guioptions+=e   " tab pages when 'showtabline'
        set guioptions-=l   " No scroll bar
        set guioptions-=L   " No scroll bar
        set guioptions-=r   " No right-hand scroll bar
        set guioptions-=R   " No right-hand scroll bar
        set guioptions-=m   " No menu
        set guioptions-=T   " No toolbar
        set guitablabel=%M\ %t   " GUI tab label
        set guicursor=a:block-blinkon0 " No blink cursor
    endif

    syntax enable   " Enable syntax highlighting

    set t_Co=256   " Number of colors
    set background=light
    colorscheme desert
    highlight clear SignColumn   " clear SignColumn background color
    highlight clear LineNr   " clear line number row backgound color

" }

" Pattern and search {
    set wildmenu   " Turn on the wild menu

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc,*.lib,*.exe,*.dll,.git,*.a,*.obj

    set incsearch   " preview first match while typing pattern
    set ignorecase   " Ignore case when searching
    set smartcase   " When searching try to be smart about cases

    " Show matching brackets when text indicator is over them
    set showmatch
" }

" Files {
    set fileformats=unix,dos,mac   " detect EOL, and use unix's EOL as default

    " Set encodings
    if has("multi_byte")
        set encoding=utf-8
        set termencoding=utf-8
        set fileencoding=utf-8
        set fileencodings=ucs-bom,utf-8,gb18030,gbk,gb2312,cp936,latin1
        scriptencoding utf-8
    endif

    " no backup nor swap,
    set nowritebackup
    set noswapfile

    if has('persistent_undo')
        set undodir=$HOME/.vim/temp/undo   " where to put backup file
        set undofile   " So is persistent undo ...
        set undolevels=1000   " Maximum changes can be undone
        set undoreload=10000   " Maximum lines for a buffer reload
    endif

    set viminfo+=n$HOME/.vim/temp/viminfo   " viminfo file
" }

" Tab, fold and indent related {
    set expandtab   " Use spaces instead of tabs
    set smarttab   " Be smart when using tabs
    " 1 tab = 4 spaces
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4

    set nowrap "NOT wrap lines

    set autoindent "Auto indent
    set smartindent "Smart indent

    set foldmethod=indent   " fold with indent
    set nofoldenable   " disable fold when startup
" }

" Useful Shortcut {
    " mute search high light before clear and redraw the screen
    nnoremap <silent> <C-c> :nohlsearch<CR><C-l>
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

    " Move around splits
    nnoremap <C-j> <C-W>j   " to below split
    nnoremap <C-k> <C-W>k   " to above split
    nnoremap <C-h> <C-W>h   " to left split
    nnoremap <C-l> <C-W>l   " to right split

    " Bash like keys for the command line
    cnoremap <C-A> <Home>
    cnoremap <C-E> <End>

    " retain visual selection after indention
    vnoremap < <gv
    vnoremap > >gv

    " cd change working directory to that of the current file
    nnoremap cd :lcd %:p:h<CR>

" }

" FileType autocmd {
    if has("autocmd")
        autocmd FileType rst set suffixesadd+=.rst
    endif
" }

" Plugin Config {
    " --- vim-gitgutter
    let g:gitgutter_enabled=1

    " --- YouCompleteMe
    let g:ycm_autoclose_preview_window_after_insertion=1
    let g:ycm_key_invoke_completion='<C-\>'
    nnoremap <leader>cg :YcmCompleter GoTo<CR>
    nnoremap <leader>cf :YcmCompleter FixIt<CR>
    nnoremap <leader>cd :YcmDiags<CR>

    " --- ultisnips
    " prevent conflict with YCM
    let g:UltiSnipsExpandTrigger = '<c-j>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

    " --- vim-snippets
    let g:author='linuor'
    let g:email='linuor at gmail dot com'
    let g:snips_author = g:author

    " --- DoxygenToolkit
    let g:DoxygenToolkit_briefTag_funcName="yes"
    let g:DoxygenToolkit_authorName=g:author
    let g:DoxygenToolkit_versionString="0.1"

    " --- vim-clang-format
    let g:clang_format#code_style = "google"
    let g:clang_format#style_options = {
        \ "AccessModifierOffset" : -4,
        \ "DerivePointerAlignment" : "false",
        \ "PointerAlignment" : "Left"}
    if has("autocmd")
        autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
        autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
    endif

    " --- Tabularize
    nnoremap <Leader>a :Tabularize /
    vnoremap <Leader>a :Tabularize /
" }
