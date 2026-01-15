#!/usr/bin/env bash

print_game() {
	local var_name="$1[@]"

	local var_game=("${!var_name}")
	local var_size=$2

	if (("$var_size" == 0)); then
		echo 'ERROR : in "print_game" function'
		echo "        size variable is equal to zero"
		echo "        exiting now"
		exit 1
	fi
	if (("${#var_game[@]}" % "$var_size" != 0)); then
		echo 'ERROR : in "print_game" function'
		echo "        game variable is not divisable by size"
		echo "        exiting now"
		exit 1
	fi

	local rows_to_print=${#var_game[@]}/var_size
	for ((i = 0; i < "$rows_to_print"; i++)); do
		for ((j = 0; j < var_size; j++)); do
			printf "%d " "${var_game[i * var_size + j]}"
		done
		printf "\n"
	done

	return 0
}

render_frame() {
	local var_name_bars="$1[@]"
	local var_name_size="$2[@]"

	local var_bars=("${!var_name_bars}")
	local var_size=("${!var_name_size}")

	local bottom_gap_col=0
	local top_gap_col=0

	printf "\033[2J" # clear the screen
	printf "\[\e[1;1H" # set the cursor to the top

	for ((col = 0; col < var_size[0]; col++)); do
		for ((row = 0; row < var_size[1]; row++)); do
			bottom_gap_col=$(((var_size[0] - var_bars[row]) / 2))
			top_gap_col=$((var_size[0] - bottom_gap_col))

			if ((col < bottom_gap_col || col > top_gap_col)); then
				printf " "
			else
				printf "0"
			fi
		done
	done
}
