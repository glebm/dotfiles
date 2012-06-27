set term=xterm-256color
set t_Co=256
set textwidth=0
set wrapmargin=0
map ,z :colorscheme grb256<cr>:set background=dark<cr>
" let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split
" Use Vim settings, rather then Vi settings (much better!).
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
" This must be first, because it changes other options as a side effect.
set nocompatible

" save read only
cmap w!! %!sudo tee > /dev/null %

" better up down on wrapped
nnoremap j gj
nnoremap k gk

" Pressing return clears highlighted search
nnoremap <CR> :nohlsearch<CR>/<BS>

" Use pathogen (http://www.vim.org/scripts/script.php?script_id=2332) for
" easier bundle management
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Make , the personal leader key
let mapleader = ","
let maplocalleader = ","

" switch between files faster
map ,, <C-^>
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

imap jj <C-[>
" command t make escape work
let g:CommandTCancelMap=['<ESC>']
" start in views or models
map <leader>v :CommandT app/views/<cr>
map <leader>m :CommandT app/models/<cr>
map <leader>t :CtrlP<CR>
" "map <leader>t :CommandTFlush<cr>:CommandT<cr>
" Make ' more useful, swap it with `

nnoremap ' `
nnoremap ` '

set backup                    " keep a backup file
set hidden                    " Allow Vim to manage hidden buffers effectively
set history=500               " keep 500 lines of command line history
set ruler                     " show the cursor position all the time
set showcmd                   " display incomplete commands
set incsearch                 " do incremental searching
set number                    " show line numbers

runtime macros/matchit.vim    " Enable extended % matching

filetype on                   " detect the type of file
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

set cf                        " enable error files and error jumping
set ffs=unix,dos,mac          " support all three, in this order
set viminfo+=!                " make sure it can save viminfo
set isk+=_,$,@,%,#,-          " none of these should be word dividers, so make them not be
set title                     " show title in xterm

" Make completion useful
set wildmenu

" Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,bundle,.sass-cache

" Specify which keys can move the cursor left/right to move to the
" previous/next line when the cursor is on the first/last character in that
" line
" set whichwrap+=<,>,[,]

" make /-style searches case-sensitive only if there is a capital letter in the search expression
set ignorecase
set smartcase

" vim togglecomment plugin
map ,/ :call CommentLineToEnd('#')<CR>+
map ,* :call CommentLinePincer('/* ', ' */')<CR>+

" automatically insert a \v before any search string, so search uses
" normal regexes
nnoremap / /\v
vnoremap / /\v

set gdefault                  " always apply substitutions globally on a line

" Clear out any search by typing <leader><space>
nnoremap <leader><space> :noh<cr>

" Sane searching
set hlsearch                  " Hilight search term
set showmatch                 " Show matching brackets
set incsearch                 " ... dynamically as they are typed
" turn of hlsearch temporarily
nmap <silent> <leader>n :silent :nohlsearch<CR>

" This line will make Vim set out tab characters, trailing whitespace and
" invisible spaces visually, and additionally use the # sign at the end of
" lines to mark lines that extend off-screen. For more info, see :h listchars.
set list
" set listchars=tab:▶\,trail:◀,extends:»,precedes:«
set listchars=tab:▸\ ,eol:¬,trail:.,extends:#,nbsp:.

nmap \o :set paste!<CR>:set paste?<CR>

" Make trailing whitespace visible with ,s
nmap <silent> <leader>s :set nolist!<CR>

set scrolloff=3               " Start scrolling 3 lines before the border

set autoread                  " Automatically reread files that have been changed externally

"set relativenumber            " show how far away each line is from the current one
" set undofile                  " save undo information

" Make ^e and ^y scroll 3 lines instead of 1
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" shorten command-line text and other info tokens (see :help shortmess)
set shortmess=atI

" Only use one space after ., ? or ! with a join command
set nojoinspaces

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Make the tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Make ';' an alias for ':'
"nnoremap : ;
nnoremap ; :

" Useful trick when I've forgotten to `sudo' before editing a file:
cmap w!! w !sudo tee % >/dev/null

" Automagically save files when focus is lost
au FocusLost * silent! :wa

" ,W strips all trailing whitespace from current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Tab mappings.
map <leader>it :tabnew<cr>
map <leader>ie :tabedit
map <leader>ic :tabclose<cr>
map <leader>io :tabonly<cr>
map <leader>in :tabnext<cr>
map <leader>ip :tabprevious<cr>
map <leader>if :tabfirst<cr>
map <leader>il :tablast<cr>
map <leader>im :tabmove

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
"map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>

" allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x
vnoremap X "_X

:nnoremap <C-e> :buffers<CR>:b<Space>

" don't move the cursor after pasting
" (by jumping to back start of previously changed text)
noremap p p`[
noremap P P`[

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set background=light         " we are using a dark background
set background=dark
syntax on                    " syntax highlighting on

colorscheme solarized
" colorscheme twilight
set guifont=Mensch:h13
set antialias
set guioptions-=L

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set backup                  " make backup file
" where to put backup file
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" directory is the directory for temp file
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set makeef=error.err         " When using make, where should it dump the file

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fo=tcrqn                 " See Help (complex)
set autoindent               " autoindent
set nosmartindent            " smartindent
set cindent                  " do c-style indenting
"set tabstop=2               " tab spacing (settings below are just to unify it)
set softtabstop=2            " unify
set shiftwidth=2             " unify
set expandtab                " use spaces instead of tabs
"set nowrap                  " do not wrap lines
set smarttab                 " use tabs at the start of a line, spaces elsewhere

" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
match WhitespaceEOL /\s\+$/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"    Enable folding, but by default make it act like folding is off, because folding is
"    annoying in anything but a few rare cases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldenable               " Turn on folding
"set foldmethod=indent       " Make folding indent sensitive
set foldmethod=marker        " 
set foldlevel=79            " Don't autofold anything (but I can still fold manually)
"set foldopen-=search        " don't open folds when you search into them
"set foldopen-=undo          " don't open folds when you undo stuff

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Encoding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set encoding="utf8"         " We always want utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Instead of having to press 'ctrl-w h' to move to the window to the left, just press ctrl-h,
" etc.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" map <C-f> <C-w>_<C-w><Pipe>

nnoremap <C-W>O :call MaximizeToggle ()<CR>
nnoremap <C-W>o :call MaximizeToggle ()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable OmniCompletion for Ruby
autocmd FileType ruby set omnifunc=rubycomplete#Complete
" ... and Rails
autocmd FileType ruby let g:rubycomplete_rails = 1
" ... and to include Classes in global completions
autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru,Capfile,*.rake}    set ft=ruby

" Syntax highlight shell scripts as per POSIX,
" not the original Bourne shell which very few use
let g:is_posix = 1

" bind control-l to hashrocket
imap <C-l> <Space>=><Space>

" NERD_Tree support
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>d :NERDTreeToggle<CR>
map <leader>c :NERDTreeFind<cr>

" CTags
" map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
let NERDTreeShowHidden=1
map <C-n> o<C-[>

:au BufNewFile,BufRead *.term,Rakefile,Gemfile,Procfile,Vagrantfile,*.rake,*.ru setlocal ft=ruby

" View schema or routes file
:map <leader>vs :e db/schema.rb<cr>
:map <leader>vr :e config/routes.rb<cr>
"nmap <cr> :nohl<cr>

" source: http://vim.wikia.com/wiki/VimTip102
" Let <Tab> do all the autocompletion
" function! Smart_TabComplete()
" 	let line = getline('.') 					" curline
" 	let substr = strpart(line, -1, col('.'))	" from start to cursor
" 	let substr = matchstr(substr, "[^ \t]*$")	" word till cursor
" 	if (strlen(substr)==0)						" nothing to match on empty string
" 		return "\<tab>"
" 	endif
" 	let has_period = match(substr, '\.') != -1	" position of period, if any
" 	let has_slash = match(substr, '\/') != -1	" position of slash, if any
" 	if (!has_period && !has_slash)
" 		return "\<C-X>\<C-P>"					" existing text matching
" 	elseif ( has_slash )
" 		return "\<C-X>\<C-F>"					" file matching
" 	else
" 		return "\<C-X>\<C-O>"					" plugin matching
" 	endif
" endfunction
" inoremap <tab> <c-r>=Smart_TabComplete()<CR>
let vimclojure#HighlightBuiltins=1 
let vimclojure#ParenRainbow=1
let g:slime_target = "tmux"

" Match parens, square and curly brackets
" but only if cursor is at end of line

" function! ConditionalPairMap(open, close)
"   let line = getline('.')
"   let col = col('.')
"   if col < col('$') || stridx(line, a:close, col + 1) != -1
"     return a:open
"   else
"     return a:open . a:close . repeat("\<left>", len(a:close))
"   endif
" endf
" inoremap <expr> ( ConditionalPairMap('(', ')')
" inoremap <expr> { ConditionalPairMap('{', '}')
" inoremap <expr> [ ConditionalPairMap('[', ']')

let g:ctrlp_custom_ignore = '\.git$\|vendor\/bundle$\|vendor/vagrant$\|\.svn$'

let g:user_zen_expandabbr_key = '<c-b><c-b>'
let g:use_zen_complete_tag = 1
