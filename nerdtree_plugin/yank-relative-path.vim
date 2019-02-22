call NERDTreeAddKeyMap({
      \ 'key': 'yr',
      \ 'callback': 'NERDTreeYankRelativePath',
      \ 'quickhelpText': 'Yank relative path of current node into the default register' })

call NERDTreeAddKeyMap({
      \ 'key': 'yy',
      \ 'callback': 'NERDTreeYankNodeName',
      \ 'quickhelpText': 'Yank filename of current node into the default register' })

function! NERDTreeYankRelativePath()
  let node = g:NERDTreeFileNode.GetSelected()
  if node != {}
    let relativePath = fnamemodify(node.path.str(), ':.')

    call setreg('"', relativePath)
    call setreg('*', relativePath)
    call nerdtree#echo("Relative path yanked!")
  endif
endfunction

function! NERDTreeYankNodeName()
  let node = g:NERDTreeFileNode.GetSelected()
  if node != {}
    let nodeName = fnamemodify(node.path.str(), ':t')

    call setreg('"', nodeName)
    call setreg('*', nodeName)
    call nerdtree#echo("Filename yanked!")
  endif
endfunction
