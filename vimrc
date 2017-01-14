" linuor's vimrc
" Fork me on GITHUB https://github.com/linuor/vimrc
" Read https://github.com/linuor/vimrc/blob/master/README.md for more info

" Bundles {
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
        Plugin 'gmarik/Vundle.vim'                  " Plugin manage
        Plugin 'bling/vim-airline'                  " status/tabline for vim
        Plugin 'aceofall/gtags.vim'                 " Integrates GNU GLOBAL source code tag system with VIM
        Plugin 'scrooloose/nerdtree'                " Tree explorer
        Plugin 'vim-scripts/YankRing.vim'           " Maintains a history of previous yanks, changes and deletes
        Plugin 'mbbill/undotree'                    " The ultimate undo history visualizer for VIM
        Plugin 'kien/ctrlp.vim'                     " Fuzzy file, buffer, mru, tag, etc finder.
        Plugin 'tpope/vim-surround'                 " Modify surroundings
        Plugin 'terryma/vim-multiple-cursors'       " Sublime Text style multiple selections for Vim
        Plugin 'vim-scripts/indent-motion'          " Vim motions to the start and end of the current indentation-delimited block
        Plugin 'vim-scripts/matchit.zip'            " extended % matching for HTML, LaTeX, and many other languages
        Plugin 'mattn/emmet-vim'                    " expanding abbreviation like zen-coding.
        Plugin 'mileszs/ack.vim'                    " run ack (a better grep) from vim, and shows the results in a split window
        Plugin 'scrooloose/nerdcommenter'           " plugin for intensely orgasmic commenting
        Plugin 'Raimondi/delimitMate'               " provides insert mode auto-completion for quotes, parens, brackets, etc.
        Plugin 'Valloric/YouCompleteMe'             " A code-completion engine for Vim
        Plugin 'rdnetto/YCM-Generator'              " Generates config files for YouCompleteMe
        Plugin 'SirVer/ultisnips'                   " The ultimate snippet solution for Vim.
        Plugin 'honza/vim-snippets'                 " Code snippets.
        Plugin 'sukima/xmledit'                     " XML/HTML tags will be completed automatically
        Plugin 'tpope/vim-repeat'                   " enable repeating supported plugin maps with '.'
        Plugin 'airblade/vim-gitgutter'             " shows a git diff in the 'gutter' (sign column)
        Plugin 'vim-scripts/DoxygenToolkit.vim'     " Simplify Doxygen documentation in C, C++, Python.
        Plugin 'altercation/vim-colors-solarized'   " solarized color schema
        Plugin 'rhysd/vim-clang-format'             " plugin for clang-format, a formatter for C, C++ and Obj-C code
        Plugin 'godlygeek/tabular'                  " script for text filtering and alignment
        Plugin 'vim-scripts/DrawIt'                 " Ascii drawing plugin: lines, ellipses, arrows, fills, and more!
        Plugin 'vim-scripts/VOoM'                   " Vim Outliner of Markers

    call vundle#end()
" }

" General {
    " let <leader> key to be ;
    let mapleader=";"

    " 0 is much easy to press than ^, which used more often
    map 0 ^

    " Sets how many lines of history VIM has to remember
    set history=1000

    " Enable filetype plugins
    filetype plugin on
    filetype indent on

    " Set to auto read when a file is changed from the outside
    set autoread

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    " Automatically enable mouse usage
    set mouse=a
    " Hide the mouse cursor while typing
    set mousehide

    " Don't redraw while executing macros (good performance config)
    set lazyredraw

    " timeout for input
    "set timeoutlen=500

    set wmw=0 " set the min width of a window to 0 so we can maximize others
    set wmh=0 " set the min height of a window to 0 so we can maximize others
" }

" UserInterface {
    " set lines to the top/bottom of the buffer
    set scrolloff=3

    " Turn on the WiLd menu
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
    set background=dark
    colorscheme solarized

    " Set fonts
    "set guifont=Source\ Code\ Pro:h11
" }

" Files, backups and undo {
    " Use Unix as the standard file type
    set ffs=unix,dos,mac

    " Set encodings
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,latin1
    scriptencoding utf-8

    " no backup nor swap, since most stuff is in SVN, git anyway...
    set nobackup
    set nowritebackup
    set noswapfile

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
    " Linebreak on 500 characters
    " set linebreak
    " set textwidth=500

    set autoindent "Auto indent
    set smartindent "Smart indent
    "set cindent "c style indent

    " fold with indent
    set foldmethod=indent
    " disable fold when startup
    set nofoldenable
" }

" Status line, Airline {
    set laststatus=2
    let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    let g:airline#extensions#hunks#enabled=0
    let g:airline#extensions#branch#enabled=1
" }

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

" Plugin Config {
    " --- GNU Global, gtags
    let g:Gtags_Auto_Update=1
    " open quick fix window.
    nmap <leader>qo :copen<CR>
    " close quick fix window.
    nmap <leader>qc :cclose<CR>
    " move to next item in quick fix win
    nmap <leader>qn :cn<CR>
    " move to prev item in quick fix win
    nmap <leader>qp :cp<CR>
    " gtags for the current word.
    nmap <leader>g :GtagsCursor<CR>
    " trigger gtags command.
    nmap <leader>qg :Gtags<SPACE>
    " list all tags in quick fix win.
    nmap <leader>qf :Gtags -f %<CR>

    " --- Nerd Tree
    " show line number
    let NERDTreeShowLineNumbers=1
    " show hidden files
    let NERDTreeShowHidden=1
    " ignore files
    let NERDTreeIgnore=['\.pyc','\~$','\.swp']
    " toggle tree window
    map <leader>nn :NERDTreeToggle<cr>
    " Find the current file in the tree.
    map <leader>nf :NERDTreeFind<cr>

    " --- YankRing
    let g:yankring_history_dir='~/.vim/temp'
    " show all content in yank list
    nnoremap <leader>yy :YRShow<CR>
    " yank prev item in yank list
    let g:yankring_replace_n_pkey='<leader>yp'
    " yank next item in yank list
    let g:yankring_replace_n_nkey='<leader>yn'

    " --- undotree
    nmap <leader>u :UndotreeToggle<cr>

    " --- CtrlP
    let g:ctrlp_working_path_mode='ra'
    let g:ctrlp_map='<c-p>'
    let g:ctrlp_cmd='CtrlPBuffer'
    let g:ctrlp_custom_ignore={
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$\|\.o$' }
    " On Windows use "dir" as fallback command.
    if has('win16') || has('win32') || has('win64')
        let s:ctrlp_fallback='dir %s /-n /b /s /a-d'
    elseif executable('ag')
        let s:ctrlp_fallback='ag %s --nocolor -l -g ""'
    elseif executable('ack-grep')
        let s:ctrlp_fallback='ack-grep %s --nocolor -f'
    elseif executable('ack')
        let s:ctrlp_fallback='ack %s --nocolor -f'
    else
        let s:ctrlp_fallback='find %s -type f'
    endif
    let g:ctrlp_user_command={
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': s:ctrlp_fallback
    \ }

    " --- vim-gitgutter
    let g:gitgutter_enabled=1

    " --- vim-indexnt-guides
    " auto enable on startup
    let g:indent_guides_enable_on_vim_startup=1
    " enable from the level 2
    let g:indent_guides_start_level=2
    " block size
    let g:indent_guides_guide_size=1
    " <leader>i to toggle indent-guide
    :nmap <silent> <Leader>i <Plug>IndentGuidesToggle

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

    " --- vim-snippets
    let g:snips_author = 'linuor'

    " --- DoxygenToolkit
    let g:DoxygenToolkit_briefTag_funcName="yes"
    let g:DoxygenToolkit_authorName="linuor"
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
