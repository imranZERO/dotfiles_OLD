"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Plugs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_custom_header =
    \ 'startify#pad(g:ascii + startify#fortune#boxed())'
let g:ascii = [
    \ 'Vi IMproved',
    \]
let g:startify_padding_left = 10
let g:startify_lists = [
    \ { 'header': ['          Recent Files'],            'type': 'files' },
    \ { 'header': ['          '. getcwd()], 'type': 'dir' },
    \ ]


noremap <S-F11> :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


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
