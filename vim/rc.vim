"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"  -> Options
"  -> General
"  -> Leader Magic
"  -> Helper Functions
"  -> Sources
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options
"""""""""
  set autoindent                 " 'ai'     take indent for new line from previous line
  set autoread                   " 'ar'     autom. read file when changed outside of Vim
  set backspace=indent,eol,start " 'bs'     how backspace works at start of line
  set belloff=all                " 'bo'     do not ring the bell for these reasons
  set cmdheight=1                " 'ch'     number of lines to use for the command-line
  set copyindent                 " 'ci'     make 'autoindent' use existing indent structure
  set encoding=utf-8             " 'enc'    encoding used internally
  set expandtab                  " 'et'     use spaces when <Tab> is inserted
  set fileformats=mac,unix,dos   " 'ffs'    automatically detected values for 'fileformat'
  set fillchars+=vert:\`         " 'fcs'    characters to use for displaying special items
  set foldlevel=1                " 'fdl'    close folds with a level higher than this
  set foldmethod=indent          " 'fdm'    folding type
  set gdefault                   " 'gd'     the ':substitute' flag 'g' is default on
  set history=1000               " 'hi'     number of command-lines that are remembered
  set hlsearch                   " 'hls'    highlight matches with last search pattern
  set ignorecase                 " 'ic'     ignore case in search patterns
  set incsearch                  " 'is'     highlight match while typing search pattern
  set lazyredraw                 " 'lz'     don't redraw while executing macros
  set matchtime=5                " 'mat'    tenths of a second to show matching paren
  set mouse=a                    "          enable the use of mouse clicks
  set mousefocus                 " 'mousef' keyboard focus follows the mouse
  set mousehide                  " 'mh'     hide mouse pointer while typing
  set nobackup                   " 'bk'	    DON'T keep backup file after overwriting a file
  set noswapfile                 " 'swf'    DON'T use a swapfile for buffers
  set nowrap                     "          long lines wrap and continue on the next line
  set nowritebackup              " 'wb'	    DON'T make a backup before overwriting a file
  set number                     " 'nu'	    print the line number in front of each line
  set numberwidth=2              " 'nuw'    number of columns used for the line number
  set relativenumber             " 'rnu'    show relative line number in front of each line
  set ruler                      " 'ru'     show cursor line and column in the status line
  set shellpipe=&>               " 'sp'     string to put output of ':make' in error file
  set shiftwidth=2               " 'sw'     number of spaces to use for (auto)indent step
  set showmatch                  " 'sm'     briefly jump to matching bracket if insert one
  set showmode                   " 'smd'    message on status line to show current mode
  set smartcase                  " 'scs'    no ignore case when pattern has uppercase
  set smartindent                " 'si'	    smart autoindenting for C programs
  set smarttab                   " 'sta'    use 'shiftwidth' when inserting <Tab>
  set softtabstop=2              " 'sts'    number of spaces that <Tab> uses while editing
  set splitbelow                 " 'sb'     new window from split is below the current one
  set splitright                 " 'spr'    new window is put right of the current one
  set tabstop=2                  " 'ts'     number of spaces that <Tab> in file uses
  set undolevels=1000            " 'ul'     maximum number of changes that can be undone
  set viminfo^=%                 " 'vi'	    use .viminfo file upon startup and exiting
  set visualbell                 " 'vb'     use visual bell instead of beeping
  set wrapscan                   " 'ws'     searches wrap around the end of the file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""
" set root directory
  let g:thcRoot = '~/Code/THC/vim/'
"------------------------------------------------------
" the spacebar is the largest key, making it the leader
" enables ALL keys to be used for leader combinations
"
" see README.md for more information
"
" set before plugins.vim (for leader mappings)
  let mapleader = ' '
"------------------------------------------------------
" source vundle plugins and settings
  exec 'source ' . g:thcRoot . 'vundle.vim'
  exec 'source ' . g:thcRoot . 'plugins.vim'
" source private configuration
  for file in split(glob(g:thcRoot . 'omit/*.vim'), '\n')
    exe 'source' file
  endfor
" turn filetype on after vundle source
  filetype plugin indent on
" treat wrapped lines as new lines
  map j gj
  map k gk
" easy escape, use tab for indenting
  inoremap <leader><leader> <esc>
  vnoremap <leader><leader> <esc>
" visual mode, pressing * or # searches for the current selection
  vnoremap <silent> * :call VisualSelection('f', '')<cr>
  vnoremap <silent> # :call VisualSelection('b', '')<cr>
"--------------------
" syntax highlighting
"--------------------
  syntax enable
  set background=dark
  try
    colorscheme gruvbox
  catch
  endtry
" vim-gitgutter - gruvbox
  highlight VertSplit ctermfg=245
  highlight VertSplit ctermbg=235
  highlight VertSplit guifg=#928374
  highlight VertSplit guibg=#282828
  highlight CursorLineNR guibg=#282828
  highlight clear SignColumn
  highlight GitGutterAdd guibg=#282828 guifg=#689d6a
  highlight GitGutterDelete guibg=#282828 guifg=#fb4934
  highlight GitGutterChange guibg=#282828 guifg=#fe8019
  highlight GitGutterChangeDelete guibg=#282828 guifg=#fabd2f
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Magic
""""""""""""""
" easy source
  nnoremap <leader>,s :source ~/.vimrc<cr>
" easy edit vim configuration files
  nnoremap <leader>,V :tabedit ~/.vimrc<cr>
  exec 'nnoremap <leader>,, :tabedit ' . g:thcRoot . 'plugins.vim<bar>vsp ' g:thcRoot . 'rc.vim<cr>'
  exec 'nnoremap <leader><< :tabedit ' . g:thcRoot . 'vundle.vim<bar>vsp '  g:thcRoot . 'rc.vim<cr>'
  exec 'nnoremap <leader>,< :tabedit ' . g:thcRoot . 'vundle.vim<bar>vsp '  g:thcRoot . 'plugins.vim<cr>'
  exec 'nnoremap <leader>,p :tabedit ' . g:thcRoot . 'plugins.vim<cr>'
  exec 'nnoremap <leader>,v :tabedit ' . g:thcRoot . 'rc.vim<cr>'
" fast help
  nnoremap <leader>hH :tab help<cr>
" help find
  nnoremap <leader>hf :help<space>
" help here (jump into/through links in help)
  nnoremap <leader>hh <c-]>
" help jump back
  nnoremap <leader>hb <c-o>
" fast jump to index.txt (ALL commands)
  nnoremap <leader>hi :tab help index.txt<cr>
" fast save
  nnoremap <leader>,w :w!<cr>
" easy visual-block mode
  nnoremap <leader>v <c-v>
" easy redo (undo undo)
  nnoremap <leader>u <c-r>
" disable highlight
  nnoremap <leader><cr> :noh<cr>
" easy marks (jump to exact spot)
  nnoremap <leader>jj `
" easy marks (jump to line)
  nnoremap <leader>jl '
" quickly open a markdown buffer for scribble
  nnoremap <leader>ee :e ~/buffer.md<cr>
" switch CWD to the directory of the open buffer
  nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" easy diff
  nnoremap <leader>dt :windo diffthis<cr>
  nnoremap <leader>df :windo diffoff<cr>
" insert date
  nnoremap <leader>id "=strftime('%Y%m%d')<cr>P
" mark duplicate lines
  nnoremap <leader>td :%call HighlightRepeats()<cr>
  nnoremap <leader>tD :call HighlightRepeats()<cr>
" surround with single quotes and comma
  nnoremap <leader>;q :call SurroundWithCommas()<cr>
" bind cursor in all windows
  nnoremap <leader>bc :call SetCursorBind()<cr>
  nnoremap <leader>br :windo :call RemoveCursorBind()<cr>
"--------
" toggles
"--------
" toggle wrap
  nnoremap <leader>;w :setlocal wrap!<cr>
" toggle paste mode
  nnoremap <leader>;p :setlocal paste!<cr>
" toggle cursor line
  nnoremap <leader>;c :set cursorline!<cr>
" toggle cursor line in all buffers in window
  nnoremap <leader>;C :windo :set cursorline!<cr>
" toggle color coloumn
  nnoremap <leader>;L :call ColorColumnToggle()<cr>
  nnoremap <leader>;l :set cursorcolumn!<cr>
"-------
" splits
"-------
" opening/closing splits
  nnoremap <leader>ss :vnew<cr>
  nnoremap <leader>sT :vsp<cr>
  nnoremap <leader>sS :sp<cr>
  nnoremap <leader>sb :new<cr>
  nnoremap <leader>sq :q!<cr>
  nnoremap <leader>sc :q<cr>
" easy split sizing
  nnoremap <leader>sf :winc \|<cr>
  nnoremap <leader>se :winc =<cr>
  nnoremap <leader>so :winc o<cr>
  nnoremap <leader>st :winc T<cr>
  nnoremap <leader>sp :vertical resize +20<cr>
  nnoremap <leader>sm :vertical resize -20<cr>
" easy split movement
  nnoremap <leader>sJ :winc J<cr>
  nnoremap <leader>sK :winc K<cr>
  nnoremap <leader>sH :winc H<cr>
  nnoremap <leader>sL :winc L<cr>
" easy way to navigate between windows
  nnoremap <leader>sj :winc j<cr>
  nnoremap <leader>sk :winc k<cr>
  nnoremap <leader>sh :winc h<cr>
  nnoremap <leader>sl :winc l<cr>
  nnoremap <leader>sn :winc l<cr>:winc \|<cr>
  nnoremap <leader>sN :winc h<cr>:winc \|<cr>
"---------------
" tabs & buffers
"---------------
" tabs
  nnoremap <leader>tn :tabnew<cr>
  nnoremap <leader>to :tabonly<cr>
  nnoremap <leader>tc :tabclose<cr>
  nnoremap <leader>tm :tabmove<space>
" open new tab with the current buffer's path
  nnoremap <leader>tt :tabedit <c-r>=expand("%:p:h")<cr>/
" buffers
  nnoremap <leader>b<leader> :bnext<cr>
  nnoremap <leader><leader>b :bprevious<cr>
  nnoremap <leader>bs :ls<cr>
" open new buffer with the current buffer's path
  nnoremap <leader>bb :e <c-r>=expand("%:p:h")<cr>/
  nnoremap <leader>bn :e <c-r>=expand("%:p:h")<cr>/
" close all the buffers
  nnoremap <leader>ba :%bd<cr>
"------------
" spell check
"------------
" toggle spell checking
  nnoremap <leader>cc :setlocal spell!<cr>
  nnoremap <leader>cn ]s
  nnoremap <leader>cp [s
  nnoremap <leader>ca zg
  nnoremap <leader>c? z=
"-----
" tags
"-----
  nnoremap <leader>ft :tag<space>
  nnoremap <leader>fT :tselect<cr>
  nnoremap <leader>fj g]
  nnoremap <leader>fu [I
  nnoremap <leader>t<leader> :tnext<cr>
  nnoremap <leader><leader>t :tprevious<cr>
"------------------------
" views-sessions-projects
"------------------------
  nnoremap <leader>;; :call SaveProject("")<left><left>
  nnoremap <leader>;: :call LoadProject("")<left><left>
" switching sessions
" :nmap <F2> :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/sessions/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper Functions
""""""""""""""""""
  function! SaveProject(projectName)
    exec 'silent !mkdir ' . g:thcRoot . 'omit/vimwiki/sessions/' . a:projectName . '> /dev/null 2>&1'
    exec 'mksession! '    . g:thcRoot . 'omit/vimwiki/sessions/' . a:projectName . '/session.vim'
    exec 'wviminfo! '     . g:thcRoot . 'omit/vimwiki/sessions/' . a:projectName . '/session.viminfo'
  endfunction
  function! LoadProject(projectName)
    exec 'rviminfo! ' . g:thcRoot . 'omit/vimwiki/sessions/' . a:projectName . '/session.viminfo'
    exec 'source '    . g:thcRoot . 'omit/vimwiki/sessions/' . a:projectName . '/session.vim'
  endfunction
" visual mode pressing * or # searches for the current selection
" super useful! From an idea by Michael Naumann
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
" returns true if paste mode is enabled
  function! HasPaste()
    if &paste
      return 'PASTE MODE  '
    endif
    return ''
  endfunction
" make vim remember position in file after reopen
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
" highlight duplicates
" http://stackoverflow.com/questions/1268032/marking-duplicate-lines
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
" for highlighting sql insert/value combos
  function! SetCursorBind()
    nnoremap <buffer> d :windo norm j<cr>
    nnoremap <buffer> f :windo norm k<cr>
  endfunction
  function! RemoveCursorBind()
    nnoremap <buffer> d d
    nnoremap <buffer> f f
  endfunction
" toggle color column
  function! ColorColumnToggle()
    if &colorcolumn
      setlocal colorcolumn=0
    else
      setlocal colorcolumn=75
    endif
  endfunction
"-------------
" saved macros
"-------------
  function! SurroundWithCommas()
    normal G$A',gvI'GA€kb
  endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sources
"""""""""
" https://github.com/amix/vimrc
" https://laracasts.com/series/vim-mastery
" http://learnvimscriptthehardway.stevelosh.com
