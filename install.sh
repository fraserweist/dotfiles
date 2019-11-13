#!/usr/bin/env bash

cd ~/dotfiles || exit 1
echo -e "\n"
echo -e "                       \033[1;97;44m fraser weist's \033[1;35;49m\n"
echo -e "          ___            ___    _____  ___  ___"
echo -e "    _____/  / ______    /  /_  /  __/ /__/ /  / ____    ______"
echo -e "   /  __   / /  __  \  /  __/ /  /_  ___  /  / / __ \  /  ___/"
echo -e "  /  /_/  / /  /_/  / /  /_  /  __/ /  / /  / /  ___/ /___  / ___"
echo -e "  \______/  \______/  \___/ /__/   /__/ /__/  \____/ /_____/ /__/"
echo -e "\n\033[1;30m"
echo -e "           (https://github.com/fraserweist/dotfiles)"

root=$(pwd)
hide=" > /dev/null 2>&1"

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machhine=Other;;
esac

# PUTTING FOLDERS WHERE THEY BELONG IN HOME
echo -e "\n \033[1;30;101m FOLDERS: \033[0;91;49m"
for folder in *; do
    if [ "$folder" != "install.sh" ] && [ "$folder" != "runcom" ] && \
      [ "$folder" != "scripts" ]; then
        ln -s $root/$folder $HOME
        rm $HOME/.$folder
        mv $HOME/$folder $HOME/.$folder
        echo -e "    linking $folder at $HOME/.$folder/"
    fi
done

# VARIOUS DOTFILES AND RC FILES IN HOME
echo -e "\n \033[1;30;43m RC FILES: \033[0;33m"
cd $root/runcom
for file in *; do
    ln -s $root/runcom/$file $HOME
    rm $HOME/.$file
    mv $HOME/$file $HOME/.$file
    echo -e "    linking $file at $HOME/.$file"
done

# RUNNABLE SCRIPTS
echo -e "\n \033[1;30;42m SCRIPTS: \033[0;32;49m"
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

# SOURCEABLE SCRIPTS
cd $root/scripts
for file in *; do
    sourceable="*.sh"
    if [[ $file != $sourceable ]]; then
        echo -e "    adding $file to $HOME/bin/"
        ln -s $root/scripts/$file $HOME/bin
        chmod +x $HOME/bin/$file
    else
        echo -e "    sourcing $file"
        source $file
    fi
done

# INSTALL PACKAGES WITH A PACKAGE MANAGER
cd $root
echo -e "\n \033[1;30;106m PACKAGES: \033[0;36;49m"
if [ -n "$(which yum)" ]; then
    while read pkg; do
        if rpm -q $pkg > /dev/null 2>&1; then
            echo -e "    package '$pkg' already installed"
        else
            echo -e "    installing package '$pkg'"
            sudo yum install $pkg -y > /dev/null 2>&1
        fi
    done < 'packages'
fi


echo -e "\n \033[1;30;105m OTHER: \033[0;35;49m"
echo -e "    installing powerline fonts"
cd $root/powerline-fonts
./install.sh > /dev/null 2>&1
echo -e "    installing vim plugins"
cd $root
vim +PlugInstall +qall > /dev/null 2>&1
wait

echo " "

# vim set syn=sh
