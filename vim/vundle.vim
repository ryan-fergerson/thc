""""""""""""""""""""""""""
" Vundle
""""""""
" Content:
"  -> Options
"  -> Plugins
"""""""""
" Options
"""""""""
  set nocompatible " be iMproved, required
  filetype off     " required
  set rtp+=~/.vim/bundle/Vundle.vim
"""""""""
" Plugins
"""""""""
  call vundle#begin()
    Plugin 'airblade/vim-gitgutter'
    Plugin 'alcesleo/vim-uppercase-sql'
    Plugin 'arcticicestudio/nord-vim'
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
    Plugin 'leafgarland/typescript-vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'mattn/emmet-vim'
    Plugin 'mileszs/ack.vim'
    Plugin 'morhetz/gruvbox'
    Plugin 'mustache/vim-mustache-handlebars'
    Plugin 'plasticboy/vim-markdown'
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
    Plugin 'vundlevim/vundle.vim'
  call vundle#end()
