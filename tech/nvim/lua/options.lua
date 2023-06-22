-- see :options for description

local o = vim.opt

o.backup=true
o.copyindent=true
o.expandtab=true
o.foldenable=true
o.gdefault=true
o.ignorecase=true
o.lazyredraw=true
o.showmode=true
o.smartcase=true
o.smartindent=true
o.splitbelow=true
o.splitright=true
o.swapfile=true
o.termguicolors=true
o.wrap=false
o.wrapscan=true
o.writebackup=true
o.undofile=true

o.cmdheight=1
o.laststatus=3
o.matchtime=5
o.shiftwidth=2
o.showtabline=0
o.softtabstop=2
o.tabstop=2
o.undolevels=1000
o.timeout=false
o.sidescrolloff=10

o.fileformats='unix'
o.mouse='a'

o.undodir=os.getenv( "HOME" ) .. '/.config/nvim/undo'
o.backupdir=os.getenv( "HOME" ) .. '/.config/nvim/backup'
o.directory=os.getenv( "HOME" ) .. '/.config/nvim/swap'

o.fillchars = o.fillchars + { 
  eob = '␀'
}

o.listchars = {
  eol   = '↩',
  tab   = '██',
  trail = '·',
  nbsp  = '!'
}

-- netrw
vim.g.netrw_sizestyle = 'H'
