#/usr/bin/env bash

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

readonly version_number=1.0.0

read -d '' version <<- EOF
	bash-specs $version_number
EOF

readonly red=$(tput setaf 1)
readonly green=$(tput setaf 2)
readonly cyan=$(tput setaf 6)
readonly default=$(tput setaf 9)

number_of_specs=0
number_of_specs_failed=0

total_elapsed_time=0

error_message=''

main() {
	(($# == 0)) && set -- *.suite

	printf '%s\n' "$version"

	for suite; do
		. "$suite"
	done

	print_summary
}

describe() {
	printf '\n%s%s\n' "$default" "$1"
}

before() {
	:
}

before_each() {
	:
}

integer_is_equal_to() {
	if ((! $1 == $2)); then
		error_message="Expected '$1' to be '$2'."

		return 1
	fi
}

integer_is_less_than() {
	if ((! $1 < $2)); then
		error_message="Expected '$1' to be less than '$2'."

		return 1
	fi
}

integer_is_greater_than() {
	if ((! $1 > $2)); then
		error_message="Expected '$1' to be greater than '$2'."

		return 1
	fi
}

string_is_equal_to() {
	if [[ ! $1 == $2 ]]; then
		error_message="Expected '$1' to be '$2'."

		return 1
	fi
}

it() {
	before_each

	local elapsed_time
	elapsed_time=$({ time eval "$2" > /dev/null 2>&1; } 2>&1)
	local result=$?

	((number_of_specs++))
	((total_elapsed_time += 10#${elapsed_time/./}))

	if ((result == 0)); then
		print_spec_result "$green" "$1" "$elapsed_time"
	else
		((number_of_specs_failed++))

		print_spec_result "$red" "$1" "$elapsed_time"

		if [[ -z $error_message ]]; then
			printf '    %s\n' "$error_message"
			error_message=''
		fi
	fi

	after_each
}

xit() {
	:
}

print_spec_result() {
	printf '%s  %s%s (%.3f s)\n' "$1" "$2" "$cyan" "$elapsed_time"
}

after() {
	:
}

after_each() {
	:
}

print_summary() {
	((number_of_specs == 1)) && local units='spec' || local units='specs'
	((number_of_specs_failed == 0)) && local color=$green || local color=$red

	printf '\n%s%s %s, %s failed%s (%d.%03d s)%s\n' "$color" "$number_of_specs" "$units" "$number_of_specs_failed" "$cyan" "$((total_elapsed_time / 1000))" "$((total_elapsed_time % 1000))" "$default"
}


main "$@"
