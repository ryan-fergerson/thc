"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Maintainer:
"     Ryan Fergerson
"     email@ryanf.tech
"     http://ryanf.tech
"
"  Version:
"     2017.DC.7
"     2017.DEVELOPING_CONFIGURATION.7
"
"  Sections:
"  -> Options
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch       "highlight matches with last search pattern
set relativenumber "show the line number relative to the line with the cursor
set ignorecase     "ignore case in search patterns
set incsearch      "show where search pattern typed so far matches
set matchpairs     "pairs of characters that '%' can match
set visualbell     "use visual bell instead of beeping
set surround       "vim-surround

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
