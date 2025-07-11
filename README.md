# Dotfiles for Fedora 42

I don't recommend using these unless you understand and want their behavior.

```
git clone --bare -b main https://github.com/phillaf/dotfiles.git ~/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout
```
