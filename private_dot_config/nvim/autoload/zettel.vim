func! zettel#edit(...)

  " build the file name
  let l:sep = ''
  if len(a:000) > 0
    let l:sep = '-'
  endif
  let l:fname = expand('~/notes/') . strftime("%F-%H%M") . l:sep . join(a:000, '-') . '.md'

  " edit the new file
  exec "e " . l:fname
endfunc
