#!/usr/bin/env bash

BARSIZE=100

render_bar() {
   local progress="$1"
   local total="$2"

   local percent=$((progress * 100 / total))

   echo "$percent"
}

render_bar 500 500
