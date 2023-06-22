#!/usr/bin/env zsh

scripts_home="$HOME/.local/bin"

cd "$scripts_home"

# list all scripts
selected=`ls $scripts_home | \
# select one with fzf
  fzf --preview-window=right,75% \
    --preview 'bat --style=numbers --color=always --line-range :500 {}'`

# exit script is $selected is empty
if [[ -z $selected ]]; then
  exit 0
fi

# show script name in history for rf.scripts
if [[ "$selected" =~ ^rf\..* ]]; then
  echo "\nscript name|$selected" >> ~/.config/nvim/backup/rf-scripts.csv
fi

# run script
tmux neww $HOME/.local/bin/$selected

