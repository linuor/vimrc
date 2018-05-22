" linuor's vimrc files.
" Less configuration, more defaults.
" Copyright © 2017 linuor. All Rights Reserved.

" Bundles {
    set nocompatible
    call plug#begin()   " auto filetype off
        Plug 'tpope/vim-commentary' " comment stuff out
        Plug 'tpope/vim-surround'   " Modify surroundings
        Plug 'tpope/vim-repeat'     " enable supported plugin maps with '.'
        Plug 'godlygeek/tabular'    " text filtering and alignment
        Plug 'SirVer/ultisnips'     " The ultimate snippet solution for Vim
        Plug 'honza/vim-snippets'   " Code snippets
        Plug 'airblade/vim-gitgutter'   " shows a git diff in the sign column
        Plug 'tpope/vim-fugitive'   " git wrapper
        Plug 'ludovicchabant/vim-gutentags'   " tag files management
        Plug 'rhysd/vim-clang-format'   " plugin for clang-format
        Plug 'vim-scripts/DoxygenToolkit.vim' " Simplify Doxygen documentation
        Plug 'vim-scripts/DrawIt'   " Ascii drawing
        Plug 'vim-voom/VOoM'        " Vim Outliner of Markers
        Plug 'vim-scripts/Unicode-RST-Tables' " restructuredText table helper
        Plug 'Valloric/YouCompleteMe'   " code-completion engine
        Plug 'Shougo/denite.nvim'   " asynchronous unite all interfaces
    call plug#end()     " auto filetype plugin indent on and syntax on

    " enable plugins released with Vim
    if !exists('g:loaded_matchit') &&
                \ findfile('plugin/matchit.vim', &rtp) ==# ''
      runtime! macros/matchit.vim   " extend matching with %
    endif
    " source /usr/local/share/gtags/gtags.vim
" }

" Tab, space, indent and fold {
    set autoindent   "Auto indent

    set backspace=indent,eol,start   " allow <BS> to delete everything
    set whichwrap+=b    " allow <BS> to move to prev line

    set smarttab        " Be smart when using tabs
    set expandtab       " Use spaces instead of tabs
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4

    set nowrap          "NOT wrap lines

    set foldmethod=indent   " fold with indent
    set nofoldenable    " disable fold when startup
" }

" General {
    set nrformats-=octal    " <C-A> <C-X> has no effect on octal numbers

    if &ttimeoutlen==-1 " map key timeout
        set ttimeout
        set ttimeoutlen=100
    endif

    set autoread        " auto read when a file is changed from the outside

    set lazyredraw      " no redraw while executing macros, better performance

    set hidden          " hidden dirty buffers when abandoned

    set nojoinspaces    " insert only one space after '.' on J
    if v:version > 703 || v:version == 703 && has("patch541")
        " Delete comment character when joining commented lines
        set formatoptions+=j
    endif

    set report=0        " always report number of lines changed
" }

" Pattern and search {
    set incsearch       " preview first match while typing pattern
    set wildmenu        " turn on the wild menu

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc,*.lib,*.exe,*.dll,.git,*.a,*.obj

    set ignorecase      " ignore case when searching
    set smartcase       " when searching try to be smart about cases

    set showmatch       " show matching brackets when cursor over

    if executable('rg') " replace grep with ripgrep
        set grepprg=rg\ --vimgrep\ --no-heading\ --column\ $*
        set grepformat=%f:%l:%c:%m,%f:%l:%m
    endif
" }

" UserInterface {
    set laststatus=2    " always show status line

    if has('cmdline_info')
        set ruler       " show the ruler
        set showcmd     " show partial commands the last line of screen
    endif

    " set margin lines
    if !&scrolloff
      set scrolloff=2
    endif
    if !&sidescrolloff
      set sidescrolloff=3
    endif
    set display+=lastline

    " minimize windows size to 0, so others can be maximized
    set winminwidth=0
    set winminheight=0

    set mouse=""        " disable mouse
    set mousehide       " hide the mouse cursor while typing

    " strings to used in list mode
    if &listchars ==# 'eol:$'
      set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    endif

    set number relativenumber   " Show line number with relative number

    set colorcolumn=80  " highligh coloum
    set cursorline      " highlight current line

    set cmdheight=2     " height of the command bar, avoid hit-enter prompts

    set hlsearch        " highlight search results

    set matchtime=1     " tenths of a second to show the matching paren

    set splitright      " place new vsplit to the right
    set splitbelow      " place new split to the bottom

    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=

    " Set extra options when running in GUI mode
    if has("gui_running")
        set guioptions+=e              " tab pages when 'showtabline'
        set guioptions-=l              " No scroll bar
        set guioptions-=L              " No scroll bar
        set guioptions-=r              " No right-hand scroll bar
        set guioptions-=R              " No right-hand scroll bar
        set guioptions-=m              " No menu
        set guioptions-=T              " No toolbar
        set guitablabel=%M\ %t         " GUI tab label
        set guicursor=a:block-blinkon0 " No blink cursor
    endif

    " allow color schemes to do bright colors without forcing bold.
    if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
        set t_Co=16
    endif

    set background=light
    colorscheme desert
    highlight clear SignColumn          " clear SignColumn background color
    highlight clear LineNr              " clear line number row backgound color
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

    " no backup nor swap
    set nowritebackup
    set noswapfile

    set history=1000                " lines of history Vim has to remember
    set tabpagemax=50               " max number of tab pages

    if has('persistent_undo')
        set undodir=$HOME/.vim/temp/undo    " locatoin for backup files
        set undofile                        " persistent undo ...
        set undolevels=1000                 " maximum changes can be undone
        set undoreload=10000                " maximum lines for a buffer reload
    endif

    set viminfo+=n$HOME/.vim/temp/viminfo   " viminfo file
    set viminfo^=!

    set sessionoptions-=options
" }

" Useful Shortcut {
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
" }

" FileType autocmd {
    " gf to search .rst file
    if has("autocmd")
        autocmd FileType rst set suffixesadd+=.rst
    endif
" }

" Plugin Config {
    " --- vim-gitgutter
    let g:gitgutter_enabled=1
    set updatetime=1000

    " --- YouCompleteMe
    " let g:ycm_autoclose_preview_window_after_insertion=1
    let g:ycm_semantic_triggers =  { 'c,cpp': ['re!\w{2}'], }
    let g:ycm_key_invoke_completion='<C-\>'
    nnoremap <leader>yg :YcmCompleter GoTo<CR>
    nnoremap <leader>yf :YcmCompleter FixIt<CR>
    nnoremap <leader>yd :YcmDiags<CR>

    " --- ultisnips
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
    " prevent conflict with YCM
    let g:UltiSnipsExpandTrigger = '<c-j>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

    " --- vim-snippets
    let g:author=$USER
    let g:email=''      " CUSTOM: set email here
    let g:snips_author = g:author
    let g:version=''    " CUSTOM: set version here

    " --- DoxygenToolkit
    let g:DoxygenToolkit_commentType="C++"
    let g:DoxygenToolkit_authorName=g:author
    let g:DoxygenToolkit_versionString=g:version
    let g:DoxygenToolkit_compactOneLineDoc = "yes"
    let g:DoxygenToolkit_compactDoc = "yes"

    " --- vim-clang-format
    nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    vnoremap <buffer><Leader>cf :ClangFormat<CR>

    " --- Tabularize
    nnoremap <Leader>a :Tabularize /
    vnoremap <Leader>a :Tabularize /

    " --- denite
    call denite#custom#var(
        \ 'buffer',
        \ 'date_format', '%Y-%m-%d %H:%M:%S')
    if executable('git')
        call denite#custom#alias('source', 'file_rec/git', 'file_rec')
        call denite#custom#var('file_rec/git', 'command',
            \ ['git', 'ls-files', '-co', '--exclude-standard'])
    endif
    if executable('rg')
        call denite#custom#var('file/rec', 'command', ['rg', '--files'])
        call denite#custom#var('grep', 'command', ['rg'])
        call denite#custom#var('grep', 'default_opts',
            \ ['--vimgrep', '--no-heading'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'final_opts', [])
    endif
    call denite#custom#map(
	    \ 'insert',
	    \ '<C-j>',
	    \ '<denite:move_to_next_line>',
	    \ 'noremap'
	    \)
	call denite#custom#map(
	    \ 'insert',
	    \ '<C-k>',
	    \ '<denite:move_to_previous_line>',
	    \ 'noremap'
	    \)
    nnoremap <leader>df :Denite file/rec<CR>

    " --- gutentags 
    " not auto tag until saving
    let g:gutentags_generate_on_missing=0
    let g:gutentags_generate_on_new=0
    nnoremap <leader>gd :let g:gutentags_enabled=!g:gutentags_enabled<cr>
    " use gtags only
    let g:gutentags_modules = []
    if executable('gtags-cscope') && executable('gtags') && has("cscope")
        set cscopeprg=gtags-cscope  " use gtags_cscope instead of cscope
        set cscopequickfix=s-,d-,c-,t-,e-,f-,i-,a-
        set cscopetag   " use cscope instead of :tag and CTRL-]
        set cscopepathcomp=3    " display the last 3 components of file
        set csverb
        let g:gutentags_modules += ['gtags_cscope']
    endif
" }
