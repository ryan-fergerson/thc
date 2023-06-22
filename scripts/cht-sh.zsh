#!/usr/bin/env zsh

selected=`cat ~/.config/tmux/cht-languages ~/.config/tmux/cht-commands | fzf`

if [[ -z $selected ]]; then
  exit 0
fi

read -p "cht.sh/$selected
Search: " query

if grep -qs "$selected" ~/.config/tmux/cht-languages; then
  query=`echo $query | tr ' ' '+'`

  tmux neww bash -c "\
    echo \"curl cht.sh/$selected/$query/\" & \
    curl --silent --show-error cht.sh/$selected/$query | \
    bat --style=plain --color=never --paging=always"
else
  tmux neww bash -c "\
    curl --silent --show-error cht.sh/$selected/~$query | \
    bat --style=plain --color=never --paging=always"
fi

