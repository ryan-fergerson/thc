#!/usr/bin/env zsh

echo ""
echo "████████╗███╗   ███╗██╗   ██╗██╗  ██╗"
echo "╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝"
echo "   ██║   ██╔████╔██║██║   ██║ ╚███╔╝"
echo "   ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗"
echo "   ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗"
echo "   ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝"
echo "=> Checking if Tmux Plugin Manager is installed"

if [ -d "$HOME/.config/tmux/plugins/tpm" ]
then
  echo "tpm exists, skipping install.."
else
  echo "Installing tpm.."
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi

echo ""
echo "=> Installing plugins.."
$HOME/.config/tmux/plugins/tpm/bin/install_plugins
