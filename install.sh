#!/usr/bin/env bash

cd ~/dotfiles || exit 1
echo -ne "$(color style:bold,fg:purple)"
echo -e "          ___            ___    _____  ___  ___"
echo -e "    _____/  / ______    /  /_  /  __/ /__/ /  / ____    ______"
echo -e "   /  __   / /  __  \  /  __/ /  /_  ___  /  / / __ \  /  ___/"
echo -e "  /  /_/  / /  /_/  / /  /_  /  __/ /  / /  / /  ___/ /___  / ___"
echo -e "  \______/  \______/  \___/ /__/   /__/ /__/  \____/ /_____/ /__/"
echo -ne "$(color style:bold,fg:light_black)"
echo -e "           (https://github.com/fraserweist/dotfiles)"

root=$(pwd)
hide=" > /dev/null 2>&1"

function print_header {
    name=$1
    color=$2
    echo -ne "\n"
    echo -ne "$(color style:bold,fg:black,bg:$color)"
    echo -ne " $name: "
    echo -ne "$(color fg:$color)"
    echo -ne "\n"
}

# PUTTING FOLDERS WHERE THEY BELONG IN HOME
print_header FOLDERS light_red
for folder in applescripts bash git iterm2 mutt tmux vim; do
    ln -s $root/$folder $HOME
    rm $HOME/.$folder
    mv $HOME/$folder $HOME/.$folder
    echo -e "    linking $folder at $HOME/.$folder/"
done

# VARIOUS DOTFILES AND RC FILES IN HOME
print_header RC_FILES yellow
cd $root/runcom
for file in *; do
    ln -s $root/runcom/$file $HOME
    rm $HOME/.$file
    mv $HOME/$file $HOME/.$file
    echo -e "    linking $file at $HOME/.$file"
done

# RUNNABLE SCRIPTS
print_header SCRIPTS light_green
rm -rf ~/bin
mkdir ~/bin

if [[ ! ":$PATH:" == *":$HOME/bin:"* ]]; then
    PATH=$PATH:$HOME/bin
    export PATH
fi
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
print_header PACKAGES light_cyan
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


print_header OTHER light_purple
echo -e "    installing powerline fonts"
git submodule update
cd $root/powerline-fonts
./install.sh > /dev/null 2>&1
echo -e "    installing vim plugins"
cd $root
vim +PlugInstall +qall > /dev/null 2>&1
wait

echo " "

# vim set syn=sh
