""""""""""""""""""""""""""
" Functions
"""""""""""
" Content:
"  -> SaveProject
"  -> LoadProject
""""""""""""""""""""""""""
  function! SaveProject(projectName)
    exec 'silent !mkdir ' . g:thcRoot . 'omit/sessions/' . a:projectName . '> /dev/null 2>&1'
    exec 'mksession! '    . g:thcRoot . 'omit/sessions/' . a:projectName . '/session.vim'
    exec 'wviminfo! '     . g:thcRoot . 'omit/sessions/' . a:projectName . '/session.viminfo'
  endfunction

  function! LoadProject(projectName)
    exec 'rviminfo! ' . g:thcRoot . 'omit/sessions/' . a:projectName . '/session.viminfo'
    exec 'source '    . g:thcRoot . 'omit/sessions/' . a:projectName . '/session.vim'
  endfunction
