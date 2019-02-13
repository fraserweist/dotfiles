# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# colors
YELLOW="\[\033[33m\]"
GREEN="\[\033[01;42;97m\]"
GREEN_TO_BLUE="\[\033[0;32;44m\]"
RED="\[\033[1;31m\]"
BLUE="\[\033[1;44;97m\]"
BLUE_TO_PURPLE="\[\033[;34;45m\]"
PURPLE="\[\033[1;45;97m\]"
PURPLE_TO_RESET="\[\033[0;35;49m\]"
WHITE="\[\033[1;107;30m\]"
RESET="\[\033[00m\]"
SEP=""

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="${debian_chroot:+($debian_chroot)}${GREEN} \u ${GREEN_TO_BLUE}${BLUE} \w ${BLUE_TO_PURPLE}${PURPLE}\$(parse_git_branch) ${PURPLE_TO_RESET}${RESET} "

# for ls colors
export LSCOLORS=GxFxCxDxBxegedabagaced
