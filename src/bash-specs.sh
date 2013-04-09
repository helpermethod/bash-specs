#!/usr/bin/env bash

# Copyright (C) 2012 Oliver Weiler
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

shopt -s nullglob

: ${TMPDIR:=/tmp}

readonly version_number='1.0.0'

read -d '' version <<- EOF
	bash-specs $version_number
EOF

readonly red_color=$(tput setaf 1)
readonly green_color=$(tput setaf 2)
readonly cyan_color=$(tput setaf 6)
readonly default_color=$(tput setaf 9)

readonly temp_dir="/$TMPDIR/$RANDOM.$RANDOM.$$"
readonly elapsed_time_store='$temporary_directory/elapsed_time.out'

number_of_specs='0'
number_of_specs_failed='0'

total_elapsed_time='0'

error_message=''

main() {
	(($# == 0)) && set -- *.suite

	printf '%s\n' "$version"

	mkdir -m 700 "$temporary_directory"
	[[ $? != 0 ]] && exit 1

	trap '__cleanup_int' INT
	trap '__cleanup_exit' EXIT

	for suite; do
		. "$suite"
	done

	__print_summary
}

describe() {
	printf '\n%s%s\n' "$default_color" "$1"
}

create_sandbox() {
  readonly sandbox="/$TMPDIR/$RANDOM.$RANDOM.$$"
  mkdir -m 700 "$sandbox"
}

before() {
	:
}

before_each() {
	:
}

integer_equals() {
	if (($1 != $2)); then
		err_msg="Expected '$1' to be '$2'."

		return 1
	fi
}

integer_is_less_than() {
	if ! (($1 < $2)); then
		err_msg="Expected '$1' to be less than '$2'."

		return 1
	fi
}

integer_is_greater_than() {
	if ! (($1 > $2)); then
		err_msg="Expected '$1' to be greater than '$2'."

		return 1
	fi
}

string_equals() {
	if [[ $1 != $2 ]]; then
		err_msg="Expected '$1' to be equal to '$2'."

		return 1
	fi
}

string_matches() {
	if ! [[ $1 =~ $2 ]]; then
		err_msg="Expected '$1' to match '$2'."

		return 1
	fi
}

it() {
	before_each

	__execute_spec "$@"

	after_each
}

__execute_spec() {
	{ time eval "$2" > /dev/null 2>&1; } 2> "$elapsed_time_file"
	local result=$?

	((number_of_specs++))

	local elapsed_time
	read elapsed_time < "$dump_file"

	__accumulate_total_elapsed_time "$elapsed_time"

	if ((result == 0)); then
		__print_spec_result "$green_color" "$1" "$elapsed_time"

		return
	fi

	((number_of_specs_failed++))

	__print_spec_result "$red_color" "$1" "$elapsed_time"

	if [[ -n $err_msg ]]; then
		printf '    %s\n' "$err_msg"
		err_msg=''
	fi
}

__accumulate_total_elapsed_time() {
	((total_elapsed_time += 10#${elapsed_time/./}))
}

__print_spec_result() {
	printf '%s  %s%s (%.3f s)\n' "$1" "$2" "$cyan_color" "$3"
}

xit() {
	:
}

after_each() {
	:
}

after() {
	:
}

__cleanup_int() {
	__cleanup_exit
	trap -- INT
	kill -INT $$
}

__cleanup_exit() {
	rm -rf "$temp_dir"
	[[ -d $sandbox ]] && rm -rf "$sandbox"

	tput init
}

__print_summary() {
	local units
	((number_of_specs == 1)) && units='spec' || units='specs'
	local color
	((number_of_specs_failed == 0)) && color=$green_color || color=$red_color
	local secs=$((total_elapsed_time / 1000))
	local millisecs=$((total_elapsed_time % 1000))

	printf '\n%s%s %s, %s failed%s (%d.%03d s)%s\n' "$color" "$number_of_specs" "$units" "$number_of_specs_failed" "$cyan_color" "$secs" "$millisecs" "$default_color"
}

main "$@"
