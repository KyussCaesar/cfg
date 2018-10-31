# Setup for my rc files
#
# Symlinks bashrc and sets global gitignore
ln -s `pwd`/bashrc ~/.bashrc
git config --global core.excludesfile `pwd`/gitignore_global

