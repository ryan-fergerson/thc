#!/usr/bin/env zsh

# an anonymous function
# runs automatically
() {
  for dir in `echo "$PATH" | tr ':' ' '`
  do
    cd "$dir"

    for file in *
    do
      if [ -x "$file" -a ! -d "$file" ]
      then
        echo "$file"
      fi
    done
  done | sort | uniq | bat
}
