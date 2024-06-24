#!/usr/bin/env bash

# Source
# https://raw.githubusercontent.com/ThePrimeagen/.dotfiles/master/bin/.local/scripts/tmux-sessionizer

# GPT-4
# In summary, this script is meant to create a new `tmux` session for a selected directory or switch to an existing session for that directory.

# 1. The script first checks if there is exactly one argument provided. If there is, it assigns that argument to the `selected` variable. If not, it uses `find` to look for directories within specified paths (`~/work/builds`, `~/projects`, `~/`, `~/work`, `~/personal`, `~/personal/yt`) and pipes the output to `fzf`, a command-line fuzzy finder, which allows the user to select one of the directories interactively. 

# 2. If `selected` is empty (i.e., no directory was selected), the script exits with status code 0 (indicating a successful exit).

# 3. `basename` is then used to get the base of the `selected` directory (i.e., the name of the directory itself, without the rest of the path). The `.` characters in this name are then replaced with `_` characters using `tr`.

# 4. The script then checks if there's a running `tmux` process by using `pgrep`, a command that looks up or signals processes based on name.

# 5. If there is no currently active `tmux` session (indicated by `-z $TMUX`) and no `tmux` process running (`-z $tmux_running`), it starts a new `tmux` session with the name set as the `selected_name` and changes the default path to the `selected` directory.

# 6. If there is already a `tmux` session or process running, it checks if a session named `selected_name` already exists using `tmux has-session -t=$selected_name`. If it does not exist, it creates a new detached session (`-ds`) with the name set as `selected_name` and changes the default path to the `selected` directory.

# 7. Finally, it switches the client to the session with the name `selected_name` using `tmux switch-client -t $selected_name`.

declare -a directories=(
  "$HOME/code"
)

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find "${directories[@]}" -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s $selected_name -c $selected
  exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
  tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
