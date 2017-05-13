""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"  Ryan Fergerson
"  email@ryanf.tech
"  http://ryanf.tech
"
" Version:
"  2017.DC.8-1
"  2017.DEVELOPING_CONFIGURATION.8-1
"
" Sections:
"  -> Options
"  -> Plugins
"
""""""""""""""""""""""""""""""""""""""""""
" Options
"""""""""
  set nocompatible " be iMproved, required
  filetype off     " required
  set rtp+=~/.vim/bundle/Vundle.vim
""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""
  call vundle#begin()
    Plugin 'vundlevim/vundle.vim'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'alcesleo/vim-uppercase-sql'
    Plugin 'chrisbra/csv.vim'
    Plugin 'craigemery/vim-autotag'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'ervandew/supertab'
    Plugin 'godlygeek/tabular'
    Plugin 'honza/vim-snippets'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'junegunn/gv.vim'
    Plugin 'morhetz/gruvbox'
    Plugin 'rking/ag.vim'
    Plugin 'sirver/ultisnips'
    Plugin 'skwp/greplace.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-vinegar'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-scripts/dbext.vim'
    Plugin 'vimwiki/vimwiki'
  call vundle#end()
