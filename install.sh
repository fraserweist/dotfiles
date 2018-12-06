#!/usr/bin/env bash

echo -e "\n\033[1;34m"
echo -e "                         fraser weist's"
echo -e "\033[1;35m"
echo -e "          ___            ___    _____  ___  ___"
echo -e "    _____/  / ______    /  /_  /  __/ /__/ /  / ____    ______"
echo -e "   /  __   / /  __  \  /  __/ /  /_  ___  /  / / __ \  /  ___/"
echo -e "  /  /_/  / /  /_/  / /  /_  /  __/ /  / /  / /  ___/ /___  / ___"
echo -e "  \______/  \______/  \___/ /__/   /__/ /__/  \____/ /_____/ /__/"
echo -e "\n\033[1;30m"
echo -e "           (https://github.com/fraserweist/dotfiles)"


root=$(pwd)

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machhine=Other;;
esac

echo -e "\n\033[1;31m  FOLDERS:\033[0;31m"
for folder in *; do
    if [ "$folder" != "install.sh" ] && [ "$folder" != "runcom" ] && \
      [ "$folder" != "scripts" ]; then
        ln -s $root/$folder $HOME
        rm $HOME/.$folder
        mv $HOME/$folder $HOME/.$folder
        echo -e "    linking $folder at $HOME/.$folder/"
    fi
done

echo -e "\n\033[1;33m  RC FILES:\033[0;33m"
cd runcom
for file in *; do
    ln -s $root/runcom/$file $HOME
    rm $HOME/.$file
    mv $HOME/$file $HOME/.$file
    echo -e "    linking $file at $HOME/.$file"
done

echo -e "\n\033[1;32m  SCRIPTS:\033[0;32m"
echo -e "    (recreating $HOME/bin/)"
rm -rf ~/bin
mkdir ~/bin

if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
    echo -e "    ($HOME/bin is already in PATH)"
else
    echo -e "    ($HOME/bin isn't in PATH, adding it)"
    PATH=$PATH:$HOME/bin
    export PATH
fi


cd ../scripts
for file in *; do
    ln -s $root/scripts/$file $HOME/bin
    echo -e "    adding $file to $HOME/bin/"
    chmod +x $HOME/bin/$file
done

echo " "

# vim set syn=sh
