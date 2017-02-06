set hlsearch       "highlight matches with last search pattern
set relativenumber "show the line number relative to the line with the cursor
set ignorecase     "ignore case in search patterns
set incsearch      "show where search pattern typed so far matches
set matchpairs     "pairs of characters that '%' can match
set visualbell     "use visual bell instead of beeping
set surround       "vim-surround

let mapleader = ' '

map <Leader>rr :action ReformatCode<CR>
map <Leader>pp :action ParameterInfo<CR>
map <Leader>tt :action ExpressionTypeInfo<CR>
map <Leader>ft :action GotoTable<CR>
map <Leader>ss :action SplitVertically<CR>
map <Leader>sd :action SplitHorizontally<CR>
map <Leader>fu :action ShowUsages<CR>
map <Leader>gt :action GotoTable<CR>
map <Leader>gs :action GotoSymbol<CR>
map <Leader>gg :action Generate<CR>
map <Leader>pp :action FileStructurePopup<CR>
