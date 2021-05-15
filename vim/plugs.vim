"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Plugs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <S-F11> :Goyo<CR>


let g:startify_custom_header =
    \ 'startify#pad(g:ascii + startify#fortune#boxed())'
let g:ascii = [
    \ 'vi improved',
    "\ '        __',
    "\ '.--.--.|__|.--------.',
    "\ '|  |  ||  ||        |',
    "\ ' \___/ |__||__|__|__|',
    "\ ''
    \]
let g:startify_padding_left = 10
let g:startify_lists = [
    \ { 'header': ['          Recent Files'],            'type': 'files' },
    \ { 'header': ['          Current Directory    '. getcwd()], 'type': 'dir' },
    \ ]


let g:sneak#label = 1


let g:netrw_banner=0
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <A-b> :NERDTreeFind<CR>
autocmd BufWinEnter * silent NERDTreeMirror


let g:slime_target = "vimterminal"

augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END


let g:vem_tabline_show = '1'
