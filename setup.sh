# Setup for my rc files
#
# Symlinks bashrc and sets global gitignore
# Must be run from the repo root.
ln -s `pwd`/bashrc ~/.bashrc
git config --global core.excludesfile `pwd`/gitignore_global

