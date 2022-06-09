""""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""
" Content:
"  -> dbext.vim
"  -> The Silver Searcher
"  -> ctrlp.vim
"  -> greplace.vim
"  -> fugitive.vim
"  -> gv.vim
"  -> vim-gitgutter
"  -> vim-airline
"  -> ultisnips
"  -> supertab
"  -> easymotion
"  -> Emmet
"  -> ack
""""""""""
" vim-plug
""""""""""
  call plug#begin()
    Plug 'airblade/vim-gitgutter'
    Plug 'alcesleo/vim-uppercase-sql'
    Plug 'arcticicestudio/nord-vim'
    Plug 'chrisbra/csv.vim'
    Plug 'craigemery/vim-autotag'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'elzr/vim-json'
    Plug 'ervandew/supertab'
    Plug 'godlygeek/tabular'
    "Plug 'honza/vim-snippets'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/gv.vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'majutsushi/tagbar'
    Plug 'mattn/emmet-vim'
    Plug 'mileszs/ack.vim'
    Plug 'morhetz/gruvbox'
    Plug 'mustache/vim-mustache-handlebars'
    Plug 'plasticboy/vim-markdown'
    "Plug 'sirver/ultisnips'
    Plug 'skwp/greplace.vim'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-vinegar'
    Plug 'vim-airline/vim-airline'
    Plug 'vundlevim/vundle.vim'
  call plug#end()
"""""""""""
" dbext.vim
"""""""""""
  let g:dbext_map_prefix = '<leader>d'
  "let g:dbext_default_DBI_column_delimiter = "\t"
  let g:dbext_default_passwd_use_secret = 1
  let g:dbext_default_type = 'pgsql'
  let g:dbext_default_window_use_horiz = 0
  let g:dbext_default_use_sep_result_buffer = 1
  exec 'let g:dbext_default_history_file = "' . g:thcRoot . 'omit/history.sql"'
"------------------------------------------------------------------
" Profile example
" let g:dbext_default_profile_TEST_QA = 'type=PGSQL:host=localhost:port=5432:dbname=db_name:user=testadmin'
"------------------------------------------------------------------
" place profiles in omit directory
"---------------------------------
" Enable syntax highlighting in result buffer
  function! DBextPostResult(db_type, buf_nr)
    if a:db_type == 'PGSQL'
      :set ft=csv
    endif
  endfunction
" Convert dbext result buffer to csv
  function! DBX2CSV()
    normal ddjddGdd:%s/|/,:%s/ //
  endfunction
" Convert dbext result buffer to csv
  nnoremap <leader>dc :call DBX2CSV()<cr>
"""""""""""""""""""""
" The Silver Searcher
"""""""""""""""""""""
  let g:ackprg = 'ag --nogroup --nocolor --column'
"""""""""""
" ctrlp.vim
"""""""""""
  set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  let g:ctrlp_match_window = 'top,order:ttb,min:1,max:35,results:35'
  let g:ctrlp_brief_prompt = 1
  nnoremap <leader>ff :CtrlP<cr>
  nnoremap <leader>fb :CtrlPBuffer<cr>
  nnoremap <leader>fr :CtrlPMRU<cr>
  nnoremap <leader>fx :CtrlPMixed<cr>
  nnoremap <leader>fm :CtrlPBufTag<cr>
""""""""""""""
" greplace.vim
""""""""""""""
  nnoremap <leader>rr :Gsearch<space>
  nnoremap <leader>rR :call GreplaceAndSave()<cr>
" global replace, save & quit
  function! GreplaceAndSave()
    :Greplace
    :wall
    :q
  endfunction
  let g:grep_cmd_opts = '--line-number'
""""""""""""""
" fugitive.vim
""""""""""""""
  nnoremap <silent> <leader>gg :Git<cr> :winc L<cr>
  nnoremap <silent> <leader>gd :Gdiff<cr>
  nnoremap <silent> <leader>gw :Gblame<cr>
  nnoremap <silent> <leader>gp :Git pull --rebase<cr>
  nnoremap <silent> <leader>gP :Git push<cr>
  nnoremap <silent> <leader>gr :Gread<cr>
  nnoremap <silent> <leader>gw :Gwrite<cr>
  nnoremap <silent> <leader>ge :Gedit<cr>
  nnoremap <silent> <leader>ga :Git add -p %<cr>
  nnoremap <silent> <leader>gh :help fugitive<cr>
  nnoremap <silent> <leader>gb :Git checkout<space>
  nnoremap <silent> <leader>gB :Git checkout -b<space>
""""""""
" gv.vim
""""""""
  nnoremap <silent> <leader>gl :GV<cr>
"""""""""""""""
" vim-gitgutter
"""""""""""""""
  let g:gitgutter_override_sign_column_highlight = 0
"""""""""""""
" vim-airline
"""""""""""""
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
"""""""""""
" ultisnips
"""""""""""
  let g:UltiSnipsExpandTrigger = "<tab>"
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
  "let g:UltiSnipsEditSplit="vertical""
""""""""""
" supertab
""""""""""
  "let g:SuperTabDefaultCompletionType = 'context'
  "let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
  "let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
  "let g:SuperTabContextDiscoverDiscovery =
  "    \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
  "autocmd FileType *
  "  \ if &omnifunc != '' |
  "  \   call SuperTabChain(&omnifunc, "<tab>") |
  "  \ endif
""""""""""""
" easymotion
""""""""""""
  let g:EasyMotion_smartcase = 1
"""""""
" Emmet
"""""""
  let g:user_emmet_leader_key = '<leader>;'
"""""
" ack
"""""
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

  nnoremap <leader>fa :Ack<space>
