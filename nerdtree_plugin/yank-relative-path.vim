call NERDTreeAddKeyMap({
      \ 'key': 'yy',
      \ 'callback': 'NERDTreeYankRelativePath',
      \ 'quickhelpText': 'Yank relative path of current node into the default register' })

function! NERDTreeYankRelativePath()
  let node = g:NERDTreeFileNode.GetSelected()
  if node != {}
    let relativePath = fnamemodify(node.path.str(), ':.')

    call setreg('"', relativePath)
    call setreg('*', relativePath)
    call nerdtree#echo("Relative path yanked!")
  endif
endfunction
