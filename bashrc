
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

#################
#               #
#   FUNCTIONS   #
#               #
#################

today() {
    echo -n "Today's date is: "
    date +"%A, %B %-d, %Y"
}

#################
#               #
#    ALIASES    #
#               #
#################

# open sublime
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'

# use class script properly (so that it may change the directory of the terminal)
alias c='. c'

# go to root
alias root='cd /'

# go to home
alias home='cd ~'

# start famitracker
alias fami='/Applications/FamiTracker.app/Contents/MacOS/startwine'

# go to bin
alias bin='cd ~/bin'

# create a new makefile (or open a local makefile)
alias makefile='vim Makefile'

# clean short
alias clean='make clean; clear'

# go to desktop
alias desktop='cd /Users/fraserweist/Desktop'

# show hidden files in finder
alias show_files='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'

# hide hidden files in finder
alias hide_files='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# list contents in certain format
alias ls='ls -GFh'

# ls -l shortcut
alias l='ls -l'

# refresh after creating aliases
alias refresh='. ~/.bashrc'

# edit this file!
alias pref='vim ~.bashrc' 
