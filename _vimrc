"	 _                            ______ ___________ _____
"	(_)      0 plugins madafaka  |___  /|  ___| ___ \  _  |
"	_ _ __ ___  _ __ __ _ _ __      / / | |__ | |_/ / | | |
"	| | '_ ` _ \| '__/ _` | '_ \   / /  |  __||    /| | | |
"	| | | | | | | | | (_| | | | |./ /___| |___| |\ \\ \_/ /
"	|_|_| |_| |_|_|  \__,_|_| |_|\_____/\____/\_| \_|\___/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Essential Options 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hidden
" Alternative =>
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

colorscheme pablo

"set guioptions -=m				" Hides the menubar in gvim
set guioptions-=r				" Hides the scrollbar in gvim
set guioptions -=T				" Hides the toolbar in gvim

set ignorecase
set smartcase

set backspace=indent,eol,start
set autoindent
set smartindent

set nostartofline
set visualbell

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
set mouse=a

set number
set number relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Netrw
let g:netrw_banner=0

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

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
" Map ESC to something sane
inoremap ii <Esc>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" command for opening tabs
nnoremap tt  :tabedit<Space>

" colorscheme switch
noremap cc :colo gotham<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Split options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow
set splitright

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Split Resizing
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Status line stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always display the status line, even if only one window is displayed
set laststatus=2

" Display the cursor position in the status line
set ruler

" colors
au InsertEnter * hi statusline ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline ctermfg=black ctermbg=cyan
hi statusline ctermfg=black ctermbg=cyan

set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=\ %n\           		" buffer number
set statusline+=%R                  	" readonly flag
set statusline+=%M                  	" modified [+] flag
set statusline+=\ %t\               	" short file name
set statusline+=%=                  	" right align
set statusline+=\ %Y\               	" file type
set statusline+=\ %3l:%-2c\         	" line + column
set statusline+=%#Cursor#       		" colour
set statusline+=\ %3p%%\            	" percentage