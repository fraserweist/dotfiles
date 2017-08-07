#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
folders="applescripts bash iterm2 mutt screen tmux vim"
files="applescripts bashrc bash_profile vimrc vim screenrc screen-layout tmux.conf tmux muttrc mutt iterm2"

##########

# create dotfiles_old in homedir
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    echo "linking $file in home directory..."
    ln -s $dir/$file ~/.$file
done

rm -rf ~/dotfiles_old
