"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Maintainer:
"     Ryan Fergerson
"     email@ryanf.tech
"     http://ryanf.tech
"
"  Version:
"     2017.DC.5-2
"     2017.DEVELOPING_CONFIGURATION.5-2
"
"  Sections:
"  -> dbext.vim
"  -> The Silver Searcher
"  -> ctrlp.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => dbext.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Profiles
" g:dbext_default_profile_'profilename' = 'var=value:var=value:...'
  let g:dbext_default_type = 'pgsql'
  let g:dbext_default_window_use_horiz = 0
  let g:dbext_default_window_width = 80
" Example (providing dummy information for security)
" let g:dbext_default_profile_QA_SERVER = 'type=PGSQL:host=192.168.0.100:port=5432:dbname=testdb:user=admin'

" Convert dbext result buffer to csv
  map <leader>mc :call DBX2CSV()<cr>

" Convert dbext result buffer to csv
  function! DBX2CSV()
    normal ddjddGdd:%s/|/,:%s/ //
  endfunction
  
" Enable syntax highlighting in result buffer
  function! DBextPostResult(db_type, buf_nr)
    if a:db_type == 'PGSQL'
      :SQLSetType postgresql
    endif
  endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => The Silver Searcher
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => ctrlp.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
