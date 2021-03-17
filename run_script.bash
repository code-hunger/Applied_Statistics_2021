#!/usr/bin/env bash

# Watches the given *.r file for changes.
# When the file changes, it's executed via Rscript and all `mupdf` processes are SIGHUP-ped in order to show the updated graphics

if [[ ! -e "$1" ]]
then
    echo File does not exist!
    exit
fi

if [[ "$1" != *.r ]]
then
    echo Works only with R files!
    exit
fi

echo Waiting for changes.

file_name=$(basename "$1")
file_dir=$(realpath "$1" | xargs dirname)

echo $file_dir
inotifywait -q -m -e close_write,moved_to "$file_dir" |
    while read -r dir event file
    do 
        if [[ "$file" != "$file_name" ]]; then continue; fi

        echo "$file changed. Executing again!"
        date
        Rscript "$1"
        pkill -HUP mupdf
        echo
    done
