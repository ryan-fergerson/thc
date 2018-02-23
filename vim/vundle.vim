""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"  Ryan Fergerson
"  email@ryanf.tech
"  http://ryanf.tech
"
" Version:
"  2017.LABX.10
"  2017.LABORATORY_EXPERIMENTS.10
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
    Plugin 'easymotion/vim-easymotion'
    Plugin 'elzr/vim-json'
    Plugin 'ervandew/supertab'
    Plugin 'godlygeek/tabular'
    Plugin 'honza/vim-snippets'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'junegunn/gv.vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'mattn/emmet-vim'
    Plugin 'morhetz/gruvbox'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'rking/ag.vim'
    Plugin 'sirver/ultisnips'
    Plugin 'skwp/greplace.vim'
    Plugin 'tpope/vim-abolish'
    Plugin 'tpope/vim-commentary'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'tpope/vim-vinegar'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-scripts/dbext.vim'
    Plugin 'vimwiki/vimwiki'
    Plugin 'yggdroot/indentline'
  call vundle#end()
