# Dotfiles

I don't recommend using these unless you understand and want their behavior.

Made for fedora 41

```
git clone --bare -b main https://phillaf@github.com/phillaf/dotfiles.git ~/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
mv .bashrc .bashrc-bkp
config checkout
```
