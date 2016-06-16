_add_quotes() {
    local word="$1"
    local quote="$2"

    local left=$(($#LBUFFER - $#word + 1))
    local right=$(($#LBUFFER + 1))

    BUFFER[$right]="$quote "
    BUFFER[$left]=$quote$BUFFER[$left]

    CURSOR=$(($CURSOR + 2))
}

_remove_quotes() {
    local word="$1"
    local quote="$2"

    local left=$(($#LBUFFER - $#word + 1))
    local right=$(($#LBUFFER - 1))

    BUFFER[$left]=""
    BUFFER[$right]=""

    if [ $left -eq 1 ]; then
        CURSOR=$(($CURSOR - 2))
    else
        CURSOR=$(($CURSOR - 1))
    fi
}

toggle-quotes() {
    local quote=${1:-"'"}
    local word=$(awk -F'[ ]' '{print $NF}' <<< "$LBUFFER")

    if [ "$LBUFFER[$#LBUFFER]" = "$quote" ]; then
        _remove_quotes "$word" "$quote"
    else
        _add_quotes "$word" "$quote"
    fi
}

zle -N toggle-quotes

# You should manually add binding like as following:
# bindkey -v "^O" toggle-quotes
