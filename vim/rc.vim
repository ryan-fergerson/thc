"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Maintainer:
"     Ryan Fergerson
"     email@ryanf.tech
"     http://ryanf.tech
"
"  Version:
"     2017.DC.6
"     2017.DEVELOPING_CONFIGURATION.6
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
  set nowritebackup              " 'wb'	    DON'T make a backup before overwriting a file
  set number                     " 'nu'	    print the line number in front of each line
  set numberwidth=2              " 'nuw'    number of columns used for the line number
  set relativenumber             " 'rnu'    show relative line number in front of each line
  set ruler                      " 'ru'     show cursor line and column in the status line
  set shiftwidth=2               " 'sw'     number of spaces to use for (auto)indent step
  set showmatch                  " 'sm'     briefly jump to matching bracket if insert one
  set showmode                   " 'smd'    message on status line to show current mode
  set smartcase                  " 'scs'    no ignore case when pattern has uppercase
  set shellpipe=&>               " 'sp'     string to put output of ':make' in error file
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Leader Magic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spacebar is the largest key, making it the leader makes
" it easy for ALL keys to be used for leader combinations
  let mapleader = ' '
" Easy edit vimrc and plugins
  nmap <leader>ee :tabedit ~/Code/DEC/vim/vundle.vim<bar>vsp ~/Code/DEC/vim/rc.vim<cr>
  nmap <leader>ep :tabedit ~/Code/DEC/vim/vundle.vim<bar>vsp ~/Code/DEC/vim/plugins.vim<cr>
  nmap <leader>ev :tabedit ~/Code/DEC/vim/rc.vim<cr>
  nmap <leader>eV :tabedit ~/.vimrc<cr>
" Fast help
  nmap <leader>hd <c-]>
  nmap <leader>hb <c-o>
  nmap <leader>hh :help<cr>:winc T<cr>
  nmap <leader>hf :help<space>
" Fast save
  nmap <leader>w :w!<cr>
" Easy visual-block mode
  nmap <leader>vv <c-v>
" Easy redo (undo undo)
  nmap <leader>uu <c-r>
" Disable highlight
  map <leader><cr> :noh<cr>
" Easy marks (jump to exact spot)
  map <leader>jj `
" Easy marks (jump to line)
  map <leader>jl '
" Quickly open a markdown buffer for scribble
  map <leader>qq :e ~/buffer.md<cr>
" Toggle paste mode on and off
  map <leader>pp :setlocal paste!<cr>
" Switch CWD to the directory of the open buffer
  map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Toggle wrap
  map <leader>tw :setlocal wrap!<cr>
" Marking duplicate lines
  map <leader>yd :%call HighlightRepeats()<cr>
  map <leader>yD :call HighlightRepeats()<cr>
" Insert date
  map <leader>id "=strftime('%Y%m%d')<cr>P
" Surround with single quotes and comma
  map <leader>yq :call SurroundWithCommas()<cr>
" Break down SQL function
  map <leader>yb :call BreakSQLFunctionCall()<cr>
" Bind cursor in all windows
  map <leader>bc :call SetCursorBind()<cr>
  map <leader>rc :call RemoveCursorBind()<cr>
" Toggle cursor line
  map <leader>mc :set cursorline!<cr>
" Toggle color coloumn
  nnoremap <leader>kc :call ColorColumnToggle()<cr>
"----------------------------------------------------------------------------------------
" Splits
"----------------------------------------------------------------------------------------
" Opening/Closing splits
  nmap <leader>ss :vnew<cr>
  nmap <leader>sT :vsp<cr>
  nmap <leader>sd :sp<cr>
  nmap <leader>sb :new<cr>
  nmap <leader>sq :q!<cr>
  nmap <leader>sc :q<cr>
" Easy split sizing
  nmap <leader>sf :winc \|<cr>
  nmap <leader>se :winc =<cr>
  nmap <leader>so :winc o<cr>
  nmap <leader>st :winc T<cr>
" Easy split movement
  nmap <leader>sJ :winc J<cr>
  nmap <leader>sK :winc K<cr>
  nmap <leader>sH :winc H<cr>
  nmap <leader>sL :winc L<cr>
" Easy way to navigate between windows
  map <leader>sj :winc j<cr>
  map <leader>sk :winc k<cr>
  map <leader>sh :winc h<cr>
  map <leader>sl :winc l<cr>
"----------------------------------------------------------------------------------------
" Tabs & Buffers
"----------------------------------------------------------------------------------------
" Tabs
  map <leader>tn :tabnew<cr>
  map <leader>to :tabonly<cr>
  map <leader>tc :tabclose<cr>
  map <leader>tm :tabmove<space>
" Open new tab with the current buffer's path
  map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Buffers
  map <leader>bl :bnext<cr>
  map <leader>bh :bprevious<cr>
  map <leader>bs :ls<cr>
" Open new buffer with the current buffer's path
  map <leader>bb :e <c-r>=expand("%:p:h")<cr>/
  map <leader>bn :e <c-r>=expand("%:p:h")<cr>/
" Close all the buffers
  map <leader>ba :%bd<cr>
"----------------------------------------------------------------------------------------
" Spell check
"----------------------------------------------------------------------------------------
" Toggle spell checking
  map <leader>cc :setlocal spell!<cr>
  map <leader>cn ]s
  map <leader>cp [s
  map <leader>ca zg
  map <leader>c? z=
"----------------------------------------------------------------------------------------
" tags
"----------------------------------------------------------------------------------------
  nnoremap <leader><leader>f :tag<space>
  nnoremap <leader><leader>s :tselect<cr>
  nnoremap <leader><leader>l g]
  nnoremap <leader>fu [I
  nnoremap <leader>j<leader> :tnext<cr>
  nnoremap <leader>k<leader> :tprevious<cr>
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
    autocmd BufWritePost ~/Code/DEC/vim/rc.vim source ~/.vimrc
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
    map d :windo norm j<cr>
    map f :windo norm k<cr>
  endfunction
  function! RemoveCursorBind()
    map d d
    map f f
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
