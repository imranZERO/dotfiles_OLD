"	_                            ______ ___________ _____
"	(_)                          |___  /|  ___| ___ \  _  |
"	_ _ __ ___  _ __ __ _ _ __     / / | |__ | |_/ / | | |
"	| | '_ ` _ \| '__/ _` | '_ \   / /  |  __||    /| | | |
"	| | | | | | | | | (_| | | | |./ /___| |___| |\ \\ \_/ /
"	|_|_| |_| |_|_|  \__,_|_| |_|\_____/\____/\_| \_|\___/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Essential Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hidden
" Alternative
"set confirm
"set autowriteall

set wildmenu
set showcmd
set hlsearch
set incsearch

"set nomodeline
set nocompatible
filetype indent plugin on
syntax on

set encoding=utf-8
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colo pablo

" set guioptions -=m			" Hides the menubar in gvim
" set guioptions-=r				" Hides the scrollbar in gvim
set guioptions -=T				" Hides the toolbar in gvim

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set backspace=indent,eol,start
set autoindent
set smartindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

set cmdheight=1

set number
set nu rnu

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

"------------------------------------------------------------
" Indentation options {{{1

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Split Resizing
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Status line stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" status bar colors -------------------------------------------
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=\ %Y\                   " file type
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage