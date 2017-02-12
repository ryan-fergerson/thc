"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Maintainer:
"     Ryan Fergerson
"     email@ryanf.tech
"     http://ryanf.tech
"
"  Version:
"     2017.DC.5-2
"     2017.DEVELOPING_CONFIGURATION.5-2
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
  Plugin 'craigemery/vim-autotag'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'rking/ag.vim'
  Plugin 'tpope/vim-vinegar'
  Plugin 'vim-scripts/dbext.vim'
call vundle#end()
