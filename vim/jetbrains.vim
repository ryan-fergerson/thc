""""""""""""""""""""""""""
" Jetbrains configuration
"""""""""""""""""""""""""
" Content:
"  -> Options
"""""""""
" Options
"""""""""
set hlsearch
set relativenumber
set ignorecase
set incsearch
set matchpairs
set visualbell
set surround
let mapleader = ' '
map <leader>rr :action ReformatCode<cr>
map <leader>pp :action ParameterInfo<cr>
map <leader>tt :action ExpressionTypeInfo<cr>
map <leader>ft :action GotoTable<cr>
map <leader>ss :action SplitVertically<cr>
map <leader>sd :action SplitHorizontally<cr>
map <leader>fu :action ShowUsages<cr>
map <leader>gt :action GotoTable<cr>
map <leader>gs :action GotoSymbol<cr>
map <leader>gg :action Generate<cr>
map <leader>pp :action FileStructurePopup<cr>
