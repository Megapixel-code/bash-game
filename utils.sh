#!/usr/bin/env bash

get_term_size() {
	# it like so :
	# term_size=($(get_term_size))
	# rows="${term_size[0]}"
	# cols="${term_size[1]}"

	local term_size

	term_size=$(stty size)
	echo "$term_size"
	return 0
}
