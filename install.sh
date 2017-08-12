#!/usr/bin/env bash

for folder in *; do
    if [ "$folder" = "install.sh" ]; then
        echo nope
    elif [ "$folder" = "runcom" ]; then
        echo nope
    else
        ln -s ~/dotfiles/$folder ~/.$folder
        echo "linking $folder in ~"
    fi
done

cd runcom
for file in *; do
    ln -s ~/dotfiles/runcom/$file ~/.$file
    echo "linking $file in ~"
done

# vim set syn=sh
