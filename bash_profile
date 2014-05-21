# Set up my config!
source ~/.profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH=/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/Users/Anton/.rvm/bin:/usr/local/mysql/bin

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/dotfiles/shell/{exports,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
