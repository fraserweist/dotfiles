# for executable commands
export PATH=~/.bin:/home/fweist/bin:/home/fweist/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/fweist/.vimpkg/bin:/usr/local/opt/coreutils/libexec/gnubin:/Library/TeX/texbin

# for terminal type
export TERM=xterm-256color

# for ???
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export MAIL=/var/mail/fraserweist

platform='unknown'
unamestr=`uname`
if [ "$unamestr" == 'Linux' ]; then
    platform='linux'
elif [ "$unamestr" == 'Darwin' ]; then
    platform='mac'
fi

if [[ $platform == 'linux' ]]; then
    xmodmap -e 'keycode 70=0x0000'
fi

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
