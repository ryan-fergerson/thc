"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Maintainer:
"     Ryan Fergerson
"     email@ryanf.tech
"     http://ryanf.tech
"
"  Version:
"     2017.DC.5
"     2017.DEVELOPING_CONFIGURATION.5
"
"  Sections:
"  -> dbext.vim
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
  map <Leader>mc :call DBX2CSV()<cr>

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
