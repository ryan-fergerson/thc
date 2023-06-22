#!/usr/bin/env zsh

echo ""
echo "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗"
echo "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║"
echo "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║"
echo "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║"
echo "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║"
echo "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"

echo "=> Checking if vim-plug is installed"

if [ -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]
then
  echo "vim-plug exists, skipping install.."
else
  echo "Installing vim-plug.."
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

echo ""
echo "=> Installing plugins.."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
