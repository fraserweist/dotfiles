#!/usr/bin/env bash

echo -e "\n\033[1;34m                         fraser weist's \033[1;35m"
echo "          ___            ___    _____  ___  ___"
echo "    _____/  / ______    /  /_  /  __/ /__/ /  / ____    ______"
echo "   /  __   / /  __  \  /  __/ /  /_  ___  /  / / __ \  /  ___/"
echo "  /  /_/  / /  /_/  / /  /_  /  __/ /  / /  / /  ___/ /___  / ___"
echo "  \______/  \______/  \___/ /__/   /__/ /__/  \____/ /_____/ /__/"
echo -e "\n\033[1;30m           (https://github.com/fraserweist/dotfiles)"

echo -e "\n\033[1;31m  FOLDERS:\033[0;31m"

for folder in *; do
    if [ "$folder" != "install.sh" ] && [ "$folder" != "runcom" ]; then
        ln -s ~/dotfiles/$folder ~
        rm ~/.$folder
        mv ~/$folder ~/.$folder
        echo -e "    linking $folder at ~/.$folder/"
    fi
done

echo -e "\n\033[1;33m  FILES:\033[0;33m"

cd runcom
for file in *; do
    ln -s ~/dotfiles/runcom/$file ~
    rm ~/.$file
    mv ~/$file ~/.$file
    echo -e "    linking $file at ~/.$file"
done

echo " "

# vim set syn=sh
