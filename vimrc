" linuor's vimrc files.
" Less configuration, more vim defaults.

" Bundles {
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
        Plugin 'gmarik/Vundle.vim'                  " Plugin manage
        Plugin 'Shougo/unite.vim'                   " Unite and create user interfaces
        Plugin 'tpope/vim-surround'                 " Modify surroundings
        Plugin 'vim-scripts/matchit.zip'            " extended % matching for HTML, LaTeX, and many other languages
        Plugin 'mileszs/ack.vim'                    " run ack (a better grep) from vim, and shows the results in a split window
        Plugin 'tpope/vim-commentary'               " comment stuff out.
        Plugin 'Valloric/YouCompleteMe'             " A code-completion engine for Vim
        Plugin 'rdnetto/YCM-Generator'              " Generates config files for YouCompleteMe
        Plugin 'SirVer/ultisnips'                   " The ultimate snippet solution for Vim.
        Plugin 'honza/vim-snippets'                 " Code snippets.
        Plugin 'sukima/xmledit'                     " XML/HTML tags will be completed automatically
        Plugin 'tpope/vim-repeat'                   " enable repeating supported plugin maps with '.'
        Plugin 'airblade/vim-gitgutter'             " shows a git diff in the 'gutter' (sign column)
        Plugin 'vim-scripts/DoxygenToolkit.vim'     " Simplify Doxygen documentation in C, C++, Python.
        Plugin 'rhysd/vim-clang-format'             " plugin for clang-format, a formatter for C, C++ and Obj-C code
        Plugin 'godlygeek/tabular'                  " script for text filtering and alignment
        Plugin 'vim-scripts/DrawIt'                 " Ascii drawing plugin: lines, ellipses, arrows, fills, and more!
        Plugin 'vim-scripts/VOoM'                   " Vim Outliner of Markers
        Plugin 'vim-scripts/Unicode-RST-Tables'     " Allows to create and edit restructuredText tables easily (Unicode and Python 3).

    call vundle#end()
" }

" General {
    " Sets how many lines of history VIM has to remember
    set history=1000

    " no backup nor swap, since most stuff is in SVN, git anyway...
    set nobackup
    set nowritebackup
    set noswapfile


    " Enable filetype plugins
    filetype plugin on
    filetype indent on

    " Set to auto read when a file is changed from the outside
    set autoread

    " Automatically enable mouse usage
    set mouse=a
    " Hide the mouse cursor while typing
    set mousehide

    " Don't redraw while executing macros (good performance config)
    set lazyredraw

    set wmw=0 " set the min width of a window to 0 so we can maximize others
    set wmh=0 " set the min height of a window to 0 so we can maximize others
" }

" UserInterface {
    " set lines to the top/bottom of the buffer
    set scrolloff=3

    " Turn on the wild menu
    set wildmenu

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc,*.lib,*.exe,*.dll,.git,*.a

    " Always show current position
    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
    endif

    " Show line number
    set number relativenumber

    "Highligh coloum at 80
    set colorcolumn=80

    " Height of the command bar
    set cmdheight=2

    " A buffer becomes hidden when it is abandoned
    set hidden

    " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l

    " Highlight search results
    set hlsearch

    " Makes search act like search in modern browsers
    set incsearch
    set ignorecase                  " Ignore case when searching
    set smartcase                   " When searching try to be smart about cases

    " For regular expressions turn magic on
    set magic

    " Show matching brackets when text indicator is over them
    set showmatch

    " Show current mode
    set showmode

    " How many tenths of a second to blink when matching brackets
    set mat=2

    " Highlight current line
    set cursorline

    " SignColumn should match background
    highlight clear SignColumn

    " Current line number row will have same background color in relative mode
    highlight clear LineNr

    " Prevents inserting two spaces after punctuation on a join (J)
    set nojoinspaces

    " Puts new vsplit windows to the right of the current
    set splitright
    " Puts new split windows to the bottom of the current
    set splitbelow

    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=

    " Set extra options when running in GUI mode
    if has("gui_running")
        set guioptions+=e          " Add tab pages when indicated with 'showtabline'.
        set guioptions-=l          " No scroll bar
        set guioptions-=L          " No scroll bar
        set guioptions-=r          " No scroll bar
        set guioptions-=R          " No scroll bar
        set guioptions-=m          " No menu
        set guioptions-=T          " No toolbar
        set guitablabel=%M\ %t     " GUI tab label
        set t_Co=256               " Number of colors
        set gcr=a:block-blinkon0   " No blink cursor
    endif

    " Enable syntax highlighting
    syntax enable

    " set background=dark
    " colorscheme solarized
    colorscheme desert

" }

" Files {
    " Use Unix as the standard file type
    set ffs=unix,dos,mac

    " Set encodings
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,latin1
    scriptencoding utf-8

    if has('persistent_undo')
        set undodir=~/.vim/temp/undo    " where to put backup file
        set undofile                    " So is persistent undo ...
        set undolevels=1000             " Maximum number of changes that can be undone
        set undoreload=10000            " Maximum number lines to save for undo on a buffer reload
    endif

    " viminfo file
    set viminfo+=n~/.vim/temp/.viminfo
" }

" Text, tab, fold and indent related {
    " Use spaces instead of tabs
    set expandtab

    " Be smart when using tabs
    set smarttab

    " 1 tab = 4 spaces
    set shiftwidth=4
    set tabstop=4

    set nowrap "NOT wrap lines

    set autoindent "Auto indent
    set smartindent "Smart indent

    " fold with indent
    set foldmethod=indent
    " disable fold when startup
    set nofoldenable
" }

" Status line {
    set laststatus=2
" }

" Useful Shortcut {
    " Move around splits
    " map <C-J> <C-W>j                        " to below split
    " map <C-K> <C-W>k                        " to above split
    " nmap <c-h> <c-w>h                       " to left split
    " nmap <c-l> <c-w>l                       " to right split

    " Tab
    " map <C-t><C-t> :tabnew<CR>              " new tab
    " map <C-t><C-w> :tabclose<CR>            " close tab

    " Bash like keys for the command line
    " cnoremap <C-A> <Home>
    " cnoremap <C-E> <End>
    " cnoremap <C-K> <C-U>

    " retain visual selection after indention
    vnoremap < <gv
    vnoremap > >gv

    " cd change working directory to that of the current file
    noremap cd :lcd %:p:h<CR>

" }

" Plugin Config {
    " --- vim-gitgutter
    let g:gitgutter_enabled=1

    " --- YouCompleteMe
    let g:ycm_confirm_extra_conf=0
    let g:ycm_key_invoke_completion='<C-\>'
    let g:ycm_autoclose_preview_window_after_insertion=1
    nnoremap <leader>jg :YcmCompleter GoTo<CR>

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
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

    " --- Tabularize
    nmap <Leader>a :Tabularize /
    vmap <Leader>a :Tabularize /
" }
