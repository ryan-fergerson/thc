# Vim Configuration
* font: FiraCode
* colorscheme: Gruvbox

## Features
* Leader system
* Shared/Private configuration

## Installation

### 1. Clone repo into .config directory
``` sh
git clone https://github.com/ryan-fergerson/thc.git
```

### 2. Load settings
**Place inside ~/.vimrc**
``` sh
source ~/Code/thc/vim/runtime-configuration.vim
```
**Place inside ~/.gvimrc (for MacVim/gVim)**
``` sh
source ~/Code/thc/vim/gui-rc.vim
```
**Place inside ~/.ideavimrc (for JetBrains)**
``` sh
source ~/Code/thc/vim/jetbrains.vim
```

### 3. Install Vundle & plugins
**Install Vundle**
``` sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
**Install Plugins**
``` vim
:PluginInstall
```

## Leader system

**A leader key with two characters can (with just the alphabet alone) create 456,976 key combinations!**

Case sensitve, mixed case characters make different commands
* \<leader\>ff
* \<leader\>FF
* \<leader\>Ff
* \<leader\>fF
