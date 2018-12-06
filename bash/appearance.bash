# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# colors
YELLOW="\[\033[33m\]"
GREEN="\[\033[01;92m\]"
PURPLE="\[\033[1;95m\]"
RED="\[\033[1;31m\]"
BLUE="\[\033[1;96m\]"
WHITE="\[\033[1;37m\]"
RESET="\[\033[00m\]"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="${debian_chroot:+($debian_chroot)}${GREEN}\u: ${BLUE}\w${WHITE}\$(parse_git_branch) ${PURPLE}>>${RESET} "

# for ls colors
export LSCOLORS=GxFxCxDxBxegedabagaced
