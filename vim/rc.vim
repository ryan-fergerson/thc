"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"   Ryan Fergerson
"   email@ryanf.tech
"   http://ryanf.tech
"
" Version: 
"   2017.WC.1
"   2017.WORKING_CONFIGURATION.1
"
" Sections:
"   -> Options
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent                 " 'ai'     take indent for new line from previous line
set autoread                   " 'ar'     autom. read file when changed outside of Vim
set autowriteall               " 'awa'    as 'autowrite', but works with more commands
set backspace=indent,eol,start " 'bs'     how backspace works at start of line
set belloff=all                " 'bo'     do not ring the bell for these reasons
set cmdheight=1                " 'ch'     number of lines to use for the command-line
set colorcolumn=65             " 'cc'     columns to highlight
set copyindent                 " 'ci'     make 'autoindent' use existing indent structure
set errorbells                 " 'eb'     ring the bell for error messages
set expandtab                  " 'et'     use spaces when <Tab> is inserted
set gdefault                   " 'gd'     the ":substitute" flag 'g' is default on
set history=1000               " 'hi'     number of command-lines that are remembered
set hlsearch                   " 'hls'    highlight matches with last search pattern
set ignorecase                 " 'ic'     ignore case in search patterns
set incsearch                  " 'is'     highlight match while typing search pattern
set lazyredraw                 " 'lz'     don't redraw while executing macros
set matchtime=5                " 'mat'    tenths of a second to show matching paren
set mouse=a                    "          enable the use of mouse clicks
set mousefocus                 " 'mousef' keyboard focus follows the mouse
set mousehide                  " 'mh'     hide mouse pointer while typing
set number                     " 'nu'     print the line number in front of each line
set numberwidth=2              " 'nuw'    number of columns used for the line number
set relativenumber             " 'rnu'    show relative line number in front of each line
set ruler                      " 'ru'     show cursor line and column in the status line
set shiftwidth=2               " 'sw'     number of spaces to use for (auto)indent step
set showmatch                  " 'sm'     briefly jump to matching bracket if insert one
set showmode                   " 'smd'    message on status line to show current mode
set smartcase                  " 'scs'    no ignore case when pattern has uppercase
set smarttab                   " 'sta'    use 'shiftwidth' when inserting <Tab>
set softtabstop=2              " 'sts'    number of spaces that <Tab> uses while editing
set tabstop=2                  " 'ts'     number of spaces that <Tab> in file uses
set undolevels=1000            " 'ul'     maximum number of changes that can be undone
set visualbell                 " 'vb'     use visual bell instead of beeping
set wrap                       "          long lines wrap and continue on the next line
set wrapscan                   " 'ws'     searches wrap around the end of the file
