""""""""""""""""""""""""""
" Functions
"""""""""""
" Content:
"  -> HighlightRepeats
"  -> VisualSelection
"  -> ColorColumnToggle
"  -> SetCursorBind
"  -> RemoveCursorBind
""""""""""""""""""""""""""
" Highlight Duplicates
" http://stackoverflow.com/questions/1268032/marking-duplicate-lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  function! HighlightRepeats() range
    let lineCounts = {}
    let lineNum = a:firstline
    while lineNum <= a:lastline
      let lineText = getline(lineNum)
      if lineText != ""
        let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
      endif
      let lineNum = lineNum + 1
    endwhile
    exe 'syn clear Repeat'
    for lineText in keys(lineCounts)
      if lineCounts[lineText] >= 2
        exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
      endif
    endfor
  endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" visual mode pressing * or # searches for the current selection
" super useful! From an idea by Michael Naumann
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
      execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
      call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
      call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
      execute "normal /" . l:pattern . "^M"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
  endfunction

  function! ColorColumnToggle()
    if &colorcolumn
      setlocal colorcolumn=0
    else
      setlocal colorcolumn=75
    endif
  endfunction
""""""""""""""""""""""""""""""""""""""""""
" Highlighting for sql insert/value combos
""""""""""""""""""""""""""""""""""""""""""
  function! SetCursorBind()
    nnoremap <buffer> d :windo norm j<cr>
    nnoremap <buffer> f :windo norm k<cr>
  endfunction

  function! RemoveCursorBind()
    nnoremap <buffer> d d
    nnoremap <buffer> f f
  endfunction
