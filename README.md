# Mac OS X setup

Just a short list of things to do when setting up a new computer with Mac OS X.


## Install brew

> ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"


## Install tools

Some handy tools.

```bash
brew install zsh
brew install git
brew install node
npm install -g grunt-cli
gem install sass
```

## Applications

* [Sublime](http://www.sublimetext.com)
* [Chrome](http://www.google.se/intl/sv/chrome/browser/)
* [Spotify](https://www.spotify.com/se)
* [Dropbox](https://www.dropbox.com/downloading?src=index)


## Load my dotfiles

You have probably already cloned the repo by now. In that case you can skip the first row. Still need to execute makesymlinks.sh though.

```bash
git clone https://github.com/antonhedstrom/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./makesymlinks.sh
```

# Thanks to...

* [Mathias Bynens](http://mathiasbynens.be/) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles)
