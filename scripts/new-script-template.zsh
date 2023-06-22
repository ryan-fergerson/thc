#!/usr/bin/env zsh

# an anonymous function
# runs automatically
() {
  for i in {0..10}; do
    printf 'TEST\n'
  done | less
}

