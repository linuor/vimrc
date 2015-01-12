" linuor's vimrc
" Fork me on GITHUB https://github.com/linuor/vimrc
" read https://github.com/linuor/vimrc/blob/master/README.md for more info


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
	Plugin 'vim-scripts/AutoClose'              " Inserts matching bracket, paren, brace or quote 
	Plugin 'tpope/vim-surround'                 " Modify surroundings
	Plugin 'vim-scripts/matchit.zip'            " extended % matching for HTML, LaTeX, and many other languages
	Plugin 'terryma/vim-multiple-cursors'       " Sublime Text style multiple selections for Vim
	Plugin 'sukima/xmledit'                     " XML/HTML tags will be completed automatically
	Plugin 'wincent/Command-T'                  " open and navigate between files with cmd-t
	Plugin 'ervandew/supertab'                  " Perform all your vim insert mode completions with Tab
    Plugin 'davidhalter/vim-snipmate'           " TextMate-style snippets for Vim
	Plugin 'honza/vim-snippets'                 " vim-snipmate default snippets (Previously snipmate-snippets) 
	Plugin 'vim-scripts/YankRing.vim'           " Maintains a history of previous yanks, changes and deletes
	Plugin 'vim-scripts/OmniCppComplete'        " C/C++ omni-completion with ctags database
	Plugin 'Lokaltog/vim-easymotion'            " An easy way to jump to a word
	Plugin 'majutsushi/tagbar'                  " browsing the tags of source files ordered by classes
	Plugin 'vim-scripts/indent-motion'          " Vim motions to the start and end of the current indentation-delimited block
	Plugin 'mattn/emmet-vim'                    " expanding abbreviation like zen-coding.
	Plugin 'mileszs/ack.vim'                    " run ack (a better grep) from vim, and shows the results in a split window
	Plugin 'airblade/vim-gitgutter'             " shows a git diff in the 'gutter' (sign column)
	Plugin 'MarcWeber/vim-addon-mw-utils'       " interpret a file by function and cache file automatically 
	Plugin 'scrooloose/nerdcommenter'           " plugin for intensely orgasmic commenting 
	Plugin 'bling/vim-airline'                  " status/tabline for vim
    "Plugin 'vim-scripts/grep.vim'
	"Plugin 'vim-scripts/bufexplorer.zip'
	"Plugin 'kien/ctrlp.vim'
	"Plugin 'vim-scripts/mru.vim'
	"Plugin 'vim-scripts/taglist.vim'
	"Plugin 'vim-scripts/DoxygenToolkit.vim'
	"Plugin 'junegunn/goyo.vim'
	"Plugin 'amix/vim-zenroom2'
	"Plugin 'vim-scripts/VOoM'
	"Plugin 'vim-scripts/DrawIt'
    "Plugin 'vim-scripts/RST-Tables-CJK'
call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Show line number
set number relativenumber

"Highligh coloum 80
set cc=80

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

colorscheme desert
set background=dark

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction
function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction


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
" move to and maximize the below split
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0 " set the min width of a window to 0 so we can maximize others
set wmh=0 " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
""map <S-H> gT
" go to next tab
""map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR>

" ,/ turn off search highlighting
""nmap <leader>/ :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
" \p toggles paste mode
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
" \g generates the header guard
map <leader>g :call IncludeGuard()<CR>
fun! IncludeGuard()
    let basename = substitute(bufname(""), '.*/', '', '')
    let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
    call append(0, "#ifndef " . guard)
    call append(1, "#define " . guard)
    call append( line("$"), "#endif // for #ifndef " . guard)
endfun

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \	if &omnifunc == "" |
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
" --- AutoClose - Inserts matching bracket, paren, brace or quote
" fixed the arrow key problems caused by AutoClose
if !has("gui_running")
    set term=linux
    imap OA <ESC>ki
    imap OB <ESC>ji
    imap OC <ESC>li
    imap OD <ESC>hi
    nmap OA k
    nmap OB j
    nmap OC l
    nmap OD h
endif

" --- Command-T
let g:CommandTMaxHeight = 15

" --- SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" --- EasyMotion
"let g:EasyMotion_leader_key = '<Leader>m' " default is <Leader>w
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

" --- Nerd Tree
map <leader>nn :NERDTreeToggle<cr>                                              
map <leader>nb :NERDTreeFromBookmark                                            
map <leader>nf :NERDTreeFind<cr> 

" --- TagBar
" toggle TagBar with F7
nnoremap <silent> <F7> :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1

" --- PowerLine
" let g:Powerline_symbols = 'fancy' " require fontpatcher

" --- SnipMate
let g:snipMateAllowMatchingDot = 0

" --- coffee-script
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw! " recompile coffee scripts on write

" --- vim-gitgutter
let g:gitgutter_enabled = 1

" set ejs filetype to html
au BufNewFile,BufRead *.ejs set filetype=html
