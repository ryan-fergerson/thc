"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"  Ryan Fergerson
"  email@ryanf.tech
"  http://ryanf.tech
"
" Version:
"  2017.DC.9
"  2017.DEVELOPING_CONFIGURATION.9
"
" Sections:
"  -> dbext.vim
"  -> The Silver Searcher
"  -> ctrlp.vim
"  -> ag
"  -> greplace.vim
"  -> fugitive.vim
"  -> gv.vim
"  -> vim-gitgutter
"  -> vim-airline
"  -> ultisnips
"  -> supertab
"  -> vimwiki
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dbext.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:dbext_map_prefix = '<leader>d'
  let g:dbext_default_type = 'pgsql'
  let g:dbext_default_window_use_horiz = 0
  let g:dbext_default_window_width = 75
  let g:dbext_default_use_sep_result_buffer = 1
  exec 'let g:dbext_default_history_file = "' . g:thcRoot . 'omit/history.sql"'
"------------------------------------------------------------------
" Profiles
" g:dbext_default_profile_'profilename' = 'var=value:var=value:...'
"------------------------------------------------------------------
" place profiles in omit directory
"---------------------------------
" Enable syntax highlighting in result buffer
  function! DBextPostResult(db_type, buf_nr)
    if a:db_type == 'PGSQL'
      :SQLSetType postgresql
    endif
  endfunction
" Convert dbext result buffer to csv
  function! DBX2CSV()
    normal ddjddGdd:%s/|/,:%s/ //
  endfunction
" Convert dbext result buffer to csv
  nnoremap <leader>dc :call DBX2CSV()<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Silver Searcher
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://robots.thoughtbot.com/faster-grepping-in-vim
  if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:ctrlp_match_window = 'top,order:ttb,min:1,max:35,results:35'
  let g:ctrlp_brief_prompt = 1
  nnoremap <leader>ff :CtrlP<cr>
  nnoremap <leader>fb :CtrlPBuffer<cr>
  nnoremap <leader>fr :CtrlPMRU<cr>
  nnoremap <leader>fx :CtrlPMixed<cr>
  nnoremap <leader>fm :CtrlPBufTag<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:ag_qhandler="vertical copen 100"
  nnoremap <leader>fa :Ag<space>
  nnoremap <leader>fq :call AgQuickFixWindow()<cr>
" reopen quickfix-window with bindings from ag.txt
  function! AgQuickFixWindow()
    :vertical cope 100
    nnoremap <silent> <buffer> h  <c-w><cr><c-w>K
    nnoremap <silent> <buffer> H  <c-w><cr><c-w>K<c-w>b
    nnoremap <silent> <buffer> o  <cr>
    nnoremap <silent> <buffer> t  <c-w><cr><c-w>T
    nnoremap <silent> <buffer> T  <c-w><cr><c-w>TgT<c-w><c-w>
    nnoremap <silent> <buffer> e  <cr><c-w><c-w>:cclose<cr>
    nnoremap <silent> <buffer> go <cr>:copen<cr>
    nnoremap <silent> <buffer> q  :cclose<cr>
  endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" greplace.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  nnoremap <leader>rr :Gsearch<space>
  nnoremap <leader>rR :call GreplaceAndSave()<cr>
" global replace, save & quit
  function! GreplaceAndSave()
    :Greplace
    :wall
    :q
  endfunction
  let g:grep_cmd_opts = '--line-number'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  nnoremap <silent> <leader>gg :Gstatus<cr> :winc L<cr>
  nnoremap <silent> <leader>gd :Gdiff<cr>
  nnoremap <silent> <leader>gw :Gblame<cr>
  nnoremap <silent> <leader>gp :Git pull<cr>
  nnoremap <silent> <leader>gP :Git push<cr>
  nnoremap <silent> <leader>gr :Gread<cr>
  nnoremap <silent> <leader>gw :Gwrite<cr>
  nnoremap <silent> <leader>ge :Gedit<cr>
  nnoremap <silent> <leader>ga :Git add -p %<cr>
  nnoremap <silent> <leader>gh :help fugitive<cr>
  nnoremap <silent> <leader>gb :Git checkout<space>
  nnoremap <silent> <leader>gB :Git checkout -b<space>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gv.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  nnoremap <silent> <leader>gl :GV<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:gitgutter_override_sign_column_highlight = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_powerline_fonts = 1
  set laststatus=2
  let g:bufferline_echo = 0
  set noshowmode
  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
  " airline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:airline_theme='gruvbox'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" trigger configuration
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" if you want :UltiSnipsEdit to split your window
  let g:UltiSnipsEditSplit="vertical"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" supertab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:SuperTabDefaultCompletionType = 'context'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:vimwiki_list = [
    \{ 
      \'path'     : g:thcRoot . 'omit/vimwiki/',
      \'syntax'   : 'markdown',
      \'ext'      : '.md',
      \'auto_toc' : 1
    \}
  \]
  let g:vimwiki_auto_chdir = 1
  let g:vimwiki_listsyms = '✗○◐●✓'
  let g:vimwiki_hl_headers = 1
  let g:vimwiki_hl_cb_checked = 1
  let g:vimwiki_folding = 'list'
" Colors
" hi VimwikiHeader1 guifg=#FF0000
" hi VimwikiHeader2 guifg=#00FF00
" hi VimwikiHeader3 guifg=#0000FF
" hi VimwikiHeader4 guifg=#FF00FF
" hi VimwikiHeader5 guifg=#00FFFF
" hi VimwikiHeader6 guifg=#FFFF00
