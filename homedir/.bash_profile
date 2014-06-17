#!/usr/bin/env bash

# Set up my config!
source ~/.profile

# Load the shell dotfiles
for file in ~/dotfiles/shell/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Load locally files
for file in ~/dotfiles/local/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset file
