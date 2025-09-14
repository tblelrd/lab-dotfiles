#!/usr/bin/env bash

clear

# Define terminal size (rows, cols)
rows=$(tput lines)
cols=$(tput cols)

# Split terminal: top 10 lines, bottom rest
top_start=1
top_end=10
bot_start=10
bot_end=$rows

# Buffers
top_counter=1
bot_counter=1

while true; do
    # --- Update top region ---
    printf '\e[%s;%sr' $top_start $top_end   # set scroll region
    printf '\e[%s;1H' $top_end               # move cursor to bottom of region
    echo "Top message $top_counter"
    ((top_counter++))

    # --- Update bottom region ---
    printf '\e[%s;%sr' $bot_start $bot_end   # set scroll region
    printf '\e[%s;1H' $bot_end               # move cursor to bottom of region
    echo "Bottom message $bot_counter"
    ((bot_counter++))

    sleep 0.5
done
