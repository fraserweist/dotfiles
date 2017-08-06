#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
files="applescripts bashrc bash_profile vimrc vim screenrc screen_layout tmux.conf tmux muttrc mutt iterm2"

##########

# create dotfiles_old in homedir
echo "creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

rm -rf ~/dotfiles_old
