"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Maintainer: 
"     Ryan Fergerson
"     email@ryanf.tech
"     http://ryanf.tech
"
"  Version: 
"     2017.DC.3.2
"     2017.DEVELOPING_CONFIGURATION.3.2
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
  set colorcolumn=70             " 'cc'     columns to highlight
  set copyindent                 " 'ci'     make 'autoindent' use existing indent structure
  set encoding=utf-8             " 'enc'    encoding used internally
  set errorbells                 " 'eb'     ring the bell for error messages
  set expandtab                  " 'et'     use spaces when <Tab> is inserted
  set fileformats=mac,unix,dos   " 'ffs'    automatically detected values for 'fileformat'
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
  set number                     " 'nu'     print the line number in front of each line
  set numberwidth=2              " 'nuw'    number of columns used for the line number
  set relativenumber             " 'rnu'    show relative line number in front of each line
  set ruler                      " 'ru'     show cursor line and column in the status line
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
  set wrap                       "          long lines wrap and continue on the next line
  set wrapscan                   " 'ws'     searches wrap around the end of the file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  source ~/Code/dec/vim/plugins.vim "       Source vundle plugins
  filetype plugin indent on         "       Enable filetype plugins
" Treat long lines as break lines 
" (useful for moving around in them)
  map j gj
  map k gk
" Easy escape
  map! .. <Esc>
  vmap .. <Esc>
" Remap VIM 0 to first non-blank character
  map 0 ^
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
  vnoremap <silent> * :call VisualSelection('f', '')<CR>
  vnoremap <silent> # :call VisualSelection('b', '')<CR>
" Syntax highlighting
  syntax enable 
  try
    "colorscheme PaperColor
    "colorscheme hybrid_reverse
    colorscheme onedark
  catch
  endtry
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Leader Magic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The spacebar is the largest key, making it the leader 
" key makes it easy for both thumbs to access it and it
" also enables ALL keys to be used for leader combinations
  let mapleader = ' '
" Easy edit vimrc and plugins
  nmap <Leader>ee :tabedit ~/Code/dec/vim/plugins.vim <bar> vsp ~/Code/dec/vim/rc.vim<cr>
  nmap <Leader>ep :tabedit ~/Code/dec/vim/plugins.vim<cr>
  nmap <Leader>ev :tabedit ~/Code/dec/vim/rc.vim<cr>
  nmap <Leader>eV :tabedit ~/.vimrc<cr>
" Fast help
  nmap <Leader>hd <C-]>
  nmap <Leader>hb <C-o>
  nmap <Leader>hh :help<cr>:winc T<cr>
  nmap <Leader>hf :help 
" Fast save
  nmap <Leader>w :w!<cr>
" Easy visual-block mode
  nmap <Leader>vv <c-v>
" Easy redo (undo undo)
  nmap <Leader>uu <c-r>
" Disable highlight
  map <Leader><cr> :noh<cr>
" Easy marks (jump to exact spot)
  map <Leader>jj `
" Easy marks (jump to line)
  map <Leader>jl '
" Quickly open a markdown buffer for scribble
  map <Leader>qq :e ~/buffer.md<cr>
" Toggle paste mode on and off
  map <Leader>pp :setlocal paste!<cr>
" Switch CWD to the directory of the open buffer
  map <Leader>cd :cd %:p:h<cr>:pwd<cr>
" Toggle wrap
  map <Leader>tw :set wrap!<cr>
"----------------------------------------------------------------------------------------
" Splits
"----------------------------------------------------------------------------------------
" Opening/Closing splits
  nmap <Leader>ss :vnew<cr>
  nmap <Leader>st :vsp<cr>
  nmap <Leader>sd :sp<cr>
  nmap <Leader>sb :new<cr>
  nmap <Leader>sq :q!<cr>
  nmap <Leader>sc :q<cr>
" Easy split sizing
  nmap <Leader>sf :winc \|<cr>
  nmap <Leader>se :winc =<cr>
  nmap <Leader>so :winc o<cr>
  nmap <Leader>sT :winc T<cr>
" Easy split movement
  nmap <Leader>sJ :winc J<cr>
  nmap <Leader>sK :winc K<cr>
  nmap <Leader>sH :winc H<cr>
  nmap <Leader>sL :winc L<cr>
" Easy way to navigate between windows
  map <Leader>sj :winc j<cr>
  map <Leader>sk :winc k<cr>
  map <Leader>sh :winc h<cr>
  map <Leader>sl :winc l<cr>
"----------------------------------------------------------------------------------------
" Tabs & Buffers
"----------------------------------------------------------------------------------------
" Tabs
  map <Leader>tn :tabnew<cr>
  map <Leader>to :tabonly<cr>
  map <Leader>tc :tabclose<cr>
  map <Leader>tm :tabmove 
  map <Leader>t<leader> :tabnext 
" Opens a new tab with the current buffer's path
" super useful when editing files in the same directory
  map <Leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Buffers
  map <Leader>bl :bnext<cr>
  map <Leader>bh :bprevious<cr>
  map <Leader>bs :ls<cr>
  map <Leader>bb :e <c-r>=expand("%:p:h")<cr>/
  map <Leader>bn :e <c-r>=expand("%:p:h")<cr>/
" Close the current buffer
  map <Leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
  map <Leader>ba :%bd<cr>
"----------------------------------------------------------------------------------------
" Spell check
"----------------------------------------------------------------------------------------
" Toggle and untoggle spell checking
  map <Leader>cc :setlocal spell!<cr>
" Spell shortcuts
  map <Leader>cn ]s
  map <Leader>cp [s
  map <Leader>ca zg
  map <Leader>c? z=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
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
    autocmd BufWritePost ~/Code/dec/vim/rc.vim source ~/.vimrc
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Sources
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/amix/vimrc
" https://laracasts.com/series/vim-mastery
