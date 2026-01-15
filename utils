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
# val=($(get_term_size))
# echo "${val[1]}"

gen_bars() {
	local var_size_name="$1[@]"

	local var_size=("${!var_size_name}")

	local var_bar=()

	for ((row = 0; row < var_size[1]; row++)); do
		var_bar[row]=$((row / 3))
	done

	echo "${var_bar[@]}"
	return 0
}
