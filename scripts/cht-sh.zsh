#!/usr/bin/env zsh

cht_sh_languages=(
  bash css html java javascript lua nodejs postgresql tmux typescript zsh
)

cht_sh_commands=(
  awk bat cat chmod chown cp curl docker docker-compose exa fd find fzf git git-commit git-rebase git-status git-worktree grep head jq kill less ls lsof man mv ps psql rename rg rm rsync sed ssh stow tail tar tig tldr tr xargs
)

selected=`printf "%s\n" "${cht_sh_languages[@]}" "${cht_sh_commands[@]}" | fzf`

if [[ -z $selected ]]; then
  exit 0
fi

read -p "cht.sh/$selected
Search: " query

if [[ " ${languages[@]} " =~ " ${selected} " ]]; then
  query=`echo $query | tr ' ' '+'`

  tmux neww bash -c "\
    echo \"curl cht.sh/$selected/$query/\" & \
    curl --silent --show-error cht.sh/$selected/$query | \
    bat --style=plain --color=never --paging=always"
else
  tmux neww bash -c "\
    curl --silent --show-error cht.sh/$selected | \
    bat --style=plain --color=never --paging=always"
fi
