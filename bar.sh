#!/usr/bin/env bash

BARSIZE=100

render() {
   local var_name="$1[@]"

   local game=("${!var_name}")
   local size="$2"

   printf "\033[2J" # clear the screen
   printf "\[\e[1;1H" # set the cursor to the top

   echo "${game[@]}"
   echo "$size"
}

game=(1 0 1 2 2 1 0 1)
s=4

render game "$s"
