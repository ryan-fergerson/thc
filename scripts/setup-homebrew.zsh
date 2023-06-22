#!/usr/bin/env bash

# homebrew needs bash
# bash doesn't load .zshenv
function exists() {
  command -v $1 >/dev/null 2>&1
}

echo ""
echo "██╗  ██╗ ██████╗ ███╗   ███╗███████╗██████╗ ██████╗ ███████╗██╗    ██╗"
echo "██║  ██║██╔═══██╗████╗ ████║██╔════╝██╔══██╗██╔══██╗██╔════╝██║    ██║"
echo "███████║██║   ██║██╔████╔██║█████╗  ██████╔╝██████╔╝█████╗  ██║ █╗ ██║"
echo "██╔══██║██║   ██║██║╚██╔╝██║██╔══╝  ██╔══██╗██╔══██╗██╔══╝  ██║███╗██║"
echo "██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗██████╔╝██║  ██║███████╗╚███╔███╔╝"
echo "╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝"

echo "=> Checking if Homebrew is installed"

if exists brew; then
  echo "brew exists, skipping install.."
else
  echo "Installing brew.."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo ""
echo "=> Installing Brewfile"
cd tech
brew bundle --verbose
