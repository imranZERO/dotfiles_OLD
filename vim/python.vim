" Bind F5 to save file if modified and execute python script in a buffer.
augroup python_map
    autocmd filetype python noremap <buffer> <F5> :w<CR>:vert term python "%"<CR>
    autocmd FileType python nnoremap <buffer> <S-F5> :call SaveAndExecutePython()<CR>
    autocmd FileType python vnoremap <buffer> <S-F5> :<C-u>call SaveAndExecutePython()<CR>
augroup END

function SaveAndExecutePython()

if &filetype == 'python'
    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete buftype=nofile noswapfile nobuflisted winfixheight 
    setlocal cursorline nonumber norelativenumber showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly nomodifiable
else
    return
endif

endfunction
