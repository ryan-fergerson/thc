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
"  -> Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set nocompatible " be iMproved, required
  filetype off     " required
  set rtp+=~/.vim/bundle/Vundle.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'craigemery/vim-autotag'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'junegunn/gv.vim'
  Plugin 'morhetz/gruvbox'
  Plugin 'rking/ag.vim'
  Plugin 'skwp/greplace.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-vinegar'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-scripts/dbext.vim'
call vundle#end()
