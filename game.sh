#!/usr/bin/env bash

TICK_RATE=24 # number of frame per second
SCREEN_HEIGHT=100
SCREEN_WIDTH=100

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
	local var_name="$1[@]"

	local var_game=("${!var_name}")
	local var_size="$2"

	printf "\033[2J" # clear the screen
	printf "\[\e[1;1H" # set the cursor to the top

	echo "${var_game[@]}"
	echo "$var_size"
}

# Each tile is 100x100.
player_position=(150 150) # x and y position of the player
player_vision=0 # deg of rotation of the player value between (0-359)
game=(1 1 1 2
	1 0 0 2
	1 0 0 2
	2 1 0 1)
game_size=4
bars=()

render_frame game "$game_size"
print_game game "$game_size"
