export NNN_TMPFILE="/tmp/nnn"

nn()
{
        nnn "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                cat $NNN_TMPFILE | echo
                rm -f $NNN_TMPFILE > /dev/null
        fi
}
