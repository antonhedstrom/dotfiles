# Set up my config!
source ~/.profile

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$PATH

# Load the shell dotfiles
for file in ~/dotfiles/shell/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Load locally files
for file in ~/dotfiles/local/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset file
