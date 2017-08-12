#!/usr/bin/env bash

echo ------------FOLDERS------------

for folder in *; do
    if [ "$folder" != "install.sh" ] && [ "$folder" != "runcom" ]; then
        ln -s ~/dotfiles/$folder ~
        rm ~/.$folder
        mv ~/$folder ~/.$folder
        echo "linking $folder in ~"
    fi
done

echo -------------FILES-------------

cd runcom
for file in *; do
    ln -s ~/dotfiles/runcom/$file ~
    rm ~/.$file
    mv ~/$file ~/.$file
    echo "linking $file in ~"
done

# vim set syn=sh
