#!/bin/bash
# Evaluate a command and cache the result

evalcache () {
        cache_file="$HOME/.cache/$(cksum <<< "$*")"
        cache_file="${cache_file%% *}"
        if [ -f "$cache_file" ]
        then
                cat "$cache_file"
                (
                        "$@" > "$cache_file" &
                )
        else
                "$@" > "$cache_file"
                cat "$cache_file"
        fi
}
