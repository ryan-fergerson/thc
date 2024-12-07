#!/usr/bin/env zsh

print "\u001b[31mTMUX Key Tables\u001b[0m"

# Extra space required before pipe in "Ctrl-Space |"
# to cause prefix layer to be displayed first
(
  tmux list-keys -P 'Ctrl-Space |'           -N -T prefix;  \
  tmux list-keys -P 'Ctrl-Space-[p]anes|'    -N -T panes;   \
  tmux list-keys -P 'Ctrl-Space-[w]indows|'  -N -T windows; \
  tmux list-keys -P 'Ctrl-Space-[s]essions|' -N -T sessions;\
  tmux list-keys -P 'Ctrl-Space-[o]ptions|'  -N -T options  \
) | sort | column -t -s '|'
