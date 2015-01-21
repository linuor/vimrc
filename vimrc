" linuor's vimrc
" Fork me on GITHUB https://github.com/linuor/vimrc
" Read https://github.com/linuor/vimrc/blob/master/README.md for more info


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'                  " Plugin manage
    Plugin 'tomtom/tlib_vim'                    " Some utility functions for VIM
    Plugin 'scrooloose/nerdtree'                " Tree explorer
    Plugin 'Townk/vim-autoclose'                " Inserts matching bracket, paren, brace or quote
    Plugin 'tpope/vim-surround'                 " Modify surroundings
    Plugin 'vim-scripts/matchit.zip'            " extended % matching for HTML, LaTeX, and many other languages
    Plugin 'vim-scripts/YankRing.vim'           " Maintains a history of previous yanks, changes and deletes
    Plugin 'terryma/vim-multiple-cursors'       " Sublime Text style multiple selections for Vim
    Plugin 'sukima/xmledit'                     " XML/HTML tags will be completed automatically
    Plugin 'kien/ctrlp.vim'                     " Fuzzy file, buffer, mru, tag, etc finder.
    Plugin 'ervandew/supertab'                  " Perform all your vim insert mode completions with Tab
    Plugin 'drmingdrmer/xptemplate'             " Code snippets engine for Vim, with snippets library.
    Plugin 'vim-scripts/OmniCppComplete'        " C/C++ omni-completion with ctags database
    Plugin 'Lokaltog/vim-easymotion'            " An easy way to jump to a word
    Plugin 'majutsushi/tagbar'                  " browsing the tags of source files ordered by classes
    Plugin 'vim-scripts/indent-motion'          " Vim motions to the start and end of the current indentation-delimited block
    Plugin 'mattn/emmet-vim'                    " expanding abbreviation like zen-coding.
    Plugin 'mileszs/ack.vim'                    " run ack (a better grep) from vim, and shows the results in a split window
    Plugin 'MarcWeber/vim-addon-mw-utils'       " interpret a file by function and cache file automatically
    Plugin 'scrooloose/nerdcommenter'           " plugin for intensely orgasmic commenting
    Plugin 'bling/vim-airline'                  " status/tabline for vim
    Plugin 'tpope/vim-repeat'                   " enable repeating supported plugin maps with '.'
    Plugin 'tpope/vim-fugitive'                 " a Git wrapper
    Plugin 'airblade/vim-gitgutter'             " shows a git diff in the 'gutter' (sign column)
    Plugin 'scrooloose/syntastic'               " Check a file's syntax when saving a file (php, ruby, tex ...)
call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
endif

" Show line number
set number relativenumber

"Highligh coloum 80
set cc=79

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

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
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
set background=dark
colorscheme desert

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set encodings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1
scriptencoding utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move backup and swap to other dir, since most stuff is in SVN, git anyway...
set backup
set wb
set swapfile

if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" Install.sh will create all the direcotries
set backupdir=~/.vim/temp/backup    " where to put backup file
set directory=~/.vim/temp/swap      " where to put swap file
set undodir=~/.vim/temp/undo        " where to put backup file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab=4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set nowrap "NOT Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always show airline
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
let g:airline#extensions#syntastic#enabled=1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Useful Shortcut
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open the error console
map <leader>cc :botright cope<CR>
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to below split
map <C-J> <C-W>j
" move to above split
map <C-K> <C-W>k
" move to left split
nmap <c-h> <c-w>h
" move to right split
nmap <c-l> <c-w>l
set wmw=0 " set the min width of a window to 0 so we can maximize others
set wmh=0 " set the min height of a window to 0 so we can maximize others
" }

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
" \pp toggles paste mode
nmap <leader>pp :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" Writing Restructured Text (Sphinx Documentation) {
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
"}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coding Shortcut
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-[ jump out of the tag stack (undo Ctrl-])
map <C-[> <ESC>:po<CR>

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \	if &omnifunc== "" |
                \	    setlocal omnifunc=syntaxcomplete#Complete |
                \	endif
endif
set cot-=preview "disable doc preview in omnicomplete
" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd BufNewFile,BufRead *.sass set ft=sass.css


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- YankRing
nnoremap <leader>y :YRShow<CR>
let g:yankring_replace_n_pkey='<c-s>'
let g:yankring_replace_n_nkey='<c-g>'
let g:yankring_history_dir='~/.vim/temp'

" --- CtrlP
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_map='<c-t>'
let g:ctrlp_cmd='CtrlPBuffer'
let g:ctrlp_custom_ignore={
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

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

" --- SuperTab
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabCompletionContexts=['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery=["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" --- EasyMotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

" --- Nerd Tree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

" --- TagBar
" toggle TagBar
nnoremap <leader>tt :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus=1

" --- coffee-script
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw! " recompile coffee scripts on write

" --- vim-gitgutter
let g:gitgutter_enabled=1

" set ejs filetype to html
au BufNewFile,BufRead *.ejs set filetype=html

" --- AutoClose
" fixed the arrow key problems caused by AutoClose
if !has("gui_running")
   imap OA <ESC>ki
   imap OB <ESC>ji
   imap OC <ESC>li
   imap OD <ESC>hi

   nmap OA k
   nmap OB j
   nmap OC l
   nmap OD h
endif

" --- Synatastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" --- xptemplate
"NO spaces in auto-completed brackets/braces
let g:xptemplate_vars="SParg=&author=linuor&email=linuor@gmail.com"
"Author & Email
" Prevent supertab from mapping <tab> to anything.
let g:SuperTabMappingForward = '<Plug>xpt_void'
" Tell XPTemplate what to fall back to, if nothing matches.
" Original SuperTab() yields nothing if g:SuperTabMappingForward was set to
" something it does not know.
let g:xptemplate_fallback = '<C-r>=XPTwrapSuperTab("n")<CR>'

fun! XPTwrapSuperTab(command) "{{{
    let v = SuperTab(a:command)
    if v == ''
        " Change \<Tab> to whatever you want, when neither XPTemplate or
        " supertab needs to do anything.
        return "\<Tab>"
    else
        return v
    end
endfunction "}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Use functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>x :ZoomToggle<CR>
