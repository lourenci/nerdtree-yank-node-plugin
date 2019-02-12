call NERDTreeAddKeyMap({
        \ 'key': 'yy',
        \ 'callback': 'NERDTreeYankRelativePath',
        \ 'quickhelpText': 'Yank relative path of current node into the default register' })

function! NERDTreeYankRelativePath()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        call setreg('"', fnamemodify(n.path.str(), ':.'))
    endif
    call nerdtree#echo("Relative path yanked!")
endfunction
