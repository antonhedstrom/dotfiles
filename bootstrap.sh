#!/usr/bin/env bash

dir="dotfiles" # Folder for this script

# In case we executed script from outside folder
cd ~;
cd "$dir";

# Make sure we have the latest
# cd ˙ git pull origin master

backup_dir="backup/$(date +%Y%m%d_%H%M%S)" # old dotfiles backup directory


# Create symlink for each dotfile. Backup any existing dotfiles.
# All files in homedir that starts with dot (excluding . and ..)
for file in $(ls homedir/.[^.]*); do
  basename="$(basename "$file")" # Strip everything but filename
  if [[ -r "~/$basename" && -f "~/$basename" ]]; then
    echo -n "~/$basename already exists. Moving to $backup_dir..."
    mv ~/$basename $backup_dir/ && echo "Done!" || echo "FAIL"
  fi

  mkdir -p $backup_dir # Create of not exists
  mv ~/$basename $backup_dir/
  echo -n "Symlink: ~/$basename -> ~/dotfiles/$file ..."
  ln -s "dotfiles/$file" ~/$basename && echo "Done!" || echo "FAIL"
done

# Reload bash_profile
source ~/.bash_profile

# Clear variables
unset dir
unset backup_dir

