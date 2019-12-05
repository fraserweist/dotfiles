# ls
alias ls='ls --color=auto -Gh'
alias la='ls -A'
alias ll='ls -alF'

if [ "$platform" = "linux" ]; then
    alias subl="/opt/Sublime\ Text\ 2/sublime_text"
elif [ "$platform" = "mac" ]; then
    alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
    alias chrome="open /Applications/Google\ Chrome.app"
fi

# watson.som.ma server ping alias
alias wping='ping watson.som.ma'

# resource bash
alias refresh='source ~/.bashrc'
alias xstart='xrdb ~/.Xresources; /usr/bin/xterm'

# dpkg specific
alias dpkg-sql='PGSERVICE=dpkgdb PAGER="less -S" psql'
alias hostname='hostname | sed "s/ip-1-71-105-180.drr1.bcpc.bloomberg.com/fweist-dev-terraform/g"'


