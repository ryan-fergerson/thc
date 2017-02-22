"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Maintainer:
"     Ryan Fergerson
"     email@ryanf.tech
"     http://ryanf.tech
"
"  Version:
"     2017.DC.7-1
"     2017.DEVELOPING_CONFIGURATION.7-1
"
"  Sections:
"  -> Options
"  -> General
"  -> Leader Magic
"  -> Helper Functions
"  -> Sources
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set autoindent                 " 'ai'     take indent for new line from previous line
  set autoread                   " 'ar'     autom. read file when changed outside of Vim
  set autowriteall               " 'awa'    as 'autowrite', but works with more commands
  set backspace=indent,eol,start " 'bs'     how backspace works at start of line
  set belloff=all                " 'bo'     do not ring the bell for these reasons
  set cmdheight=1                " 'ch'     number of lines to use for the command-line
  set copyindent                 " 'ci'     make 'autoindent' use existing indent structure
  set encoding=utf-8             " 'enc'    encoding used internally
  set expandtab                  " 'et'     use spaces when <Tab> is inserted
  set fileformats=mac,unix,dos   " 'ffs'    automatically detected values for 'fileformat'
  set fillchars+=vert:\`         " 'fcs'    characters to use for displaying special items
  set foldlevel=2                " 'fdl'    close folds with a level higher than this
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spacebar is the largest key, making it the leader makes
" it easy for ALL keys to be used for leader combinations
" MUST set before plugins.vim (for <leader> mappings)
  let mapleader = ' '
" Source vundle plugins and settings
  source ~/Code/DEC/vim/vundle.vim
  source ~/Code/DEC/vim/plugins.vim
  filetype plugin indent on
" Treat wrapped lines as new lines
  map j gj
  map k gk
" Easy escape
  inoremap <space><space> <esc>
  vnoremap <space><space> <esc>
" Visual mode pressing * or # searches for the current selection
  vnoremap <silent> * :call VisualSelection('f', '')<cr>
  vnoremap <silent> # :call VisualSelection('b', '')<cr>
" Syntax highlighting
  syntax enable 
  set background=dark
  try
    colorscheme gruvbox
  catch
  endtry
"----------------------------------------------------------------------------------------
" vim-gitgutter - gruvbox
"----------------------------------------------------------------------------------------
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Leader Magic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy edit vimrc and plugins
  nnoremap <leader>,, :tabedit ~/Code/DEC/vim/plugins.vim<bar>vsp ~/Code/DEC/vim/rc.vim<cr>
  nnoremap <leader><< :tabedit ~/Code/DEC/vim/vundle.vim<bar>vsp ~/Code/DEC/vim/rc.vim<cr>
  nnoremap <leader>,< :tabedit ~/Code/DEC/vim/vundle.vim<bar>vsp ~/Code/DEC/vim/plugins.vim<cr>
  nnoremap <leader>,p :tabedit ~/Code/DEC/vim/plugins.vim<cr>
  nnoremap <leader>,v :tabedit ~/Code/DEC/vim/rc.vim<cr>
  nnoremap <leader>,V :tabedit ~/.vimrc<cr>
" Fast help
  nnoremap <leader>hH :help<cr>:winc T<cr>
  nnoremap <leader>hh <c-]>
  nnoremap <leader>hb <c-o>
  nnoremap <leader>hf :help<space>
" Fast save
  nnoremap <leader>w :w!<cr>
" Easy visual-block mode
  nnoremap <leader>v <c-v>
" Easy redo (undo undo)
  nnoremap <leader>u <c-r>
" Disable highlight
  nnoremap <leader><cr> :noh<cr>
" Easy marks (jump to exact spot)
  nnoremap <leader>jj `
" Easy marks (jump to line)
  nnoremap <leader>jl '
" Quickly open a markdown buffer for scribble
  nnoremap <leader>ee :e ~/buffer.md<cr>
" Switch CWD to the directory of the open buffer
  nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" Mark duplicate lines
  nnoremap <leader>td :%call HighlightRepeats()<cr>
  nnoremap <leader>tD :call HighlightRepeats()<cr>
" Insert date
  nnoremap <leader>id "=strftime('%Y%m%d')<cr>P
" Surround with single quotes and comma
  nnoremap <leader>;q :call SurroundWithCommas()<cr>
" Break down SQL function
  nnoremap <leader>;b :call BreakSQLFunctionCall()<cr>
" Bind cursor in all windows
  nnoremap <leader>bc :call SetCursorBind()<cr>
  nnoremap <leader>br :windo :call RemoveCursorBind()<cr>
" Toggle paste mode
  nnoremap <leader>pp :setlocal paste!<cr>
" Toggle cursor line
  nnoremap <leader>Tc :set cursorline!<cr>
" Toggle cursor line in all buffers in window
  nnoremap <leader>TC :windo :set cursorline!<cr>
" Toggle color coloumn
  nnoremap <leader>Tl :call ColorColumnToggle()<cr>
" Toggle wrap
  nnoremap <leader>Tw :setlocal wrap!<cr>
"----------------------------------------------------------------------------------------
" Splits
"----------------------------------------------------------------------------------------
" Opening/Closing splits
  nnoremap <leader>ss :vnew<cr>
  nnoremap <leader>sT :vsp<cr>
  nnoremap <leader>sS :sp<cr>
  nnoremap <leader>sb :new<cr>
  nnoremap <leader>sq :q!<cr>
  nnoremap <leader>sc :q<cr>
" Easy split sizing
  nnoremap <leader>sf :winc \|<cr>
  nnoremap <leader>se :winc =<cr>
  nnoremap <leader>so :winc o<cr>
  nnoremap <leader>st :winc T<cr>
  nnoremap <leader>sp :vertical resize +20<cr>
  nnoremap <leader>sm :vertical resize -20<cr>
" Easy split movement
  nnoremap <leader>sJ :winc J<cr>
  nnoremap <leader>sK :winc K<cr>
  nnoremap <leader>sH :winc H<cr>
  nnoremap <leader>sL :winc L<cr>
" Easy way to navigate between windows
  nnoremap <leader>sj :winc j<cr>
  nnoremap <leader>sk :winc k<cr>
  nnoremap <leader>sh :winc h<cr>
  nnoremap <leader>sl :winc l<cr>
"----------------------------------------------------------------------------------------
" Tabs & Buffers
"----------------------------------------------------------------------------------------
" Tabs
  nnoremap <leader>tn :tabnew<cr>
  nnoremap <leader>to :tabonly<cr>
  nnoremap <leader>tc :tabclose<cr>
  nnoremap <leader>tm :tabmove<space>
" Open new tab with the current buffer's path
  nnoremap <leader>tt :tabedit <c-r>=expand("%:p:h")<cr>/
" Buffers
  nnoremap <leader>b<leader> :bnext<cr>
  nnoremap <leader><leader>b :bprevious<cr>
  nnoremap <leader>bs :ls<cr>
" Open new buffer with the current buffer's path
  nnoremap <leader>bb :e <c-r>=expand("%:p:h")<cr>/
  nnoremap <leader>bn :e <c-r>=expand("%:p:h")<cr>/
" Close all the buffers
  nnoremap <leader>ba :%bd<cr>
"----------------------------------------------------------------------------------------
" Spell check
"----------------------------------------------------------------------------------------
" Toggle spell checking
  nnoremap <leader>cc :setlocal spell!<cr>
  nnoremap <leader>cn ]s
  nnoremap <leader>cp [s
  nnoremap <leader>ca zg
  nnoremap <leader>c? z=
"----------------------------------------------------------------------------------------
" tags
"----------------------------------------------------------------------------------------
  nnoremap <leader>ft :tag<space>
  nnoremap <leader>fT :tselect<cr>
  nnoremap <leader>fj g]
  nnoremap <leader>fu [I
  nnoremap <leader>t<leader> :tnext<cr>
  nnoremap <leader><leader>t :tprevious<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
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
" Automatically source vimrc on save
  augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/Code/DEC/vim/grc.vim source ~/.vimrc
    autocmd BufWritePost ~/Code/DEC/vim/jetbrains.vim source ~/.vimrc
    autocmd BufWritePost ~/Code/DEC/vim/plugins.vim source ~/.vimrc
    autocmd BufWritePost ~/Code/DEC/vim/rc.vim source ~/.vimrc
    autocmd BufWritePost ~/Code/DEC/vim/vundle.vim source ~/.vimrc
  augroup END
" Returns true if paste mode is enabled
  function! HasPaste()
    if &paste
      return 'PASTE MODE  '
    endif
    return ''
  endfunction
" Make VIM remember position in file after reopen
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
" Highlight duplicates
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
" For highlighting SQL insert/value combos
  function! SetCursorBind()
    nnoremap <buffer> d :windo norm j<cr>
    nnoremap <buffer> f :windo norm k<cr>
  endfunction
  function! RemoveCursorBind()
    nnoremap <buffer> d d
    nnoremap <buffer> f f
  endfunction
" Toggle color column
  function! ColorColumnToggle()
    if &colorcolumn
      setlocal colorcolumn=0
    else
      setlocal colorcolumn=75
    endif
  endfunction
"----------------------------------------------------------------------------------------
" Saved macros
"----------------------------------------------------------------------------------------
  function! SurroundWithCommas()
    normal G$A',gvI'GA€kb
  endfunction
  function! BreakSQLFunctionCall()
    normal f(af,a;a;a;a;a;a;a;a;a;a;a;a;;a;af';if)ij
  endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Sources
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/amix/vimrc
" https://laracasts.com/series/vim-mastery
" http://learnvimscriptthehardway.stevelosh.com
