if [ ! -n "$BOOKMARKS" ]; then
    BOOKMARKS=$HOME/.bookmarks
fi
touch $BOOKMARKS

function check_help {
    if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
        echo ""
        echo "  gs <bookmark> - save a bookmark"
        echo "  gg <bookmark> - go to saved bookmark"
        echo "  gp <bookmark> - print directory represented by bookmark"
        echo "  gd <bookmark> - delete bookmark"
        echo "  gl            - list all bookmarks"
        kill -SIGINT $$
    fi
}

# save the bookmark
function gs {
    check_help $1
    if [ -n "$1" ]; then
        _purge_line $BOOKMARKS "export BOOKMARK_$1="
        CURDIR=$(echo $PWD | sed "s#^$HOME#\$HOME#g")
        echo "export BOOKMARK_$1=\"$CURDIR\"" >> $BOOKMARKS
    fi
}

# go to the bookmark's dir
function gg {
    check_help $1
    source $BOOKMARKS
    destination="$(eval echo $(echo \$BOOKMARK_$1))"
    if [ -d "$destination" ]; then
        cd "$destination"
    elif [ ! -n "$destination" ]; then
        echo "no bookmark named '$1'"
    else
        echo "'$destination' is not a directory"
    fi
}

# print out the bookmark and the dir it points to
function gp {
    check_help $1
    echo "$1 => $(eval echo $(echo \$BOOKMARK_$1))"
}

function gd {
    check_help $1
    if [ -n "$1" ]; then
        _purge_line $BOOKMARKS "export BOOKMARK_$1="
        unset "BOOKMARK_$1"
    fi
}

# lists bookmarks and the dirs they point to
function gl {
    check_help " $1"
    source $BOOKMARKS
    env | grep "^BOOKMARK_" | cut -c10- | sort | grep "^.*="
}

# lists bookmark names without dirs
function _l {
    check_help $1
    env | grep "^BOOKMARK_" | cut -c10- | sort | grep "^.*=" | cut -d "=" -f1
}

# delete the bookmark
function _purge_line {
    check_help $1
    if [ -s "$1" ]; then
        # create a tempfile, and trap it's removal in case something goes wrong
        tmpfile=$(mktemp -t bookmarks.XXXXX) || exit 1
        trap "rm -f $tmpfile" EXIT

        # delete line
        sed "/$2/d" $1 > $tmpfile
        mv $tmpfile $BOOKMARKS
        rm -f $tmpfile

        trap - EXIT
    fi
}
