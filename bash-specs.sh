#/usr/bin/env bash

describe() {
	printf '%s%s\n' "$default_color" "$1"
}

before_each() {
	:
}

after_each() {
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
	if [[ ! $1 = $2 ]]; then
		error_message="Expected '$1' to be '$2'."

		return 1
	fi
}

it() {
	before_each

	eval "$2"

	local result=$?

	((number_of_specs++))

	if ((result == 0)); then
		printf '%s  %s%s (0.000s)\n' "$green_color" "$1" "$cyan_color"
	else
		((number_of_specs_failed++))

		printf '%s  %s\n' "$red_color" "$1"

		if [[ $error_message ]]; then
			printf '    %s\n' "$error_message"
			unset -v error_message
		fi
	fi

	after_each
}

xit() {
	:
}

print_summary() {
	((number_of_specs == 1)) && local units='spec' || local units='specs'
	((number_of_specs_failed == 0)) && local color=$green_color || local color=$red_color

	printf '\n%s%s %s, %s failed%s (0.000s)%s\n' "$color" "$number_of_specs" "$units" "$number_of_specs_failed" "$cyan_color" "$default_color"
}

execute_suites() {
	printf '%s\n\n' "$version"

	for suite; do
		. "$suite"
	done

	print_summary
}

version_number=1.0.0

read -d '' version <<- EOF
	bash-specs $version_number
EOF

red_color=$(tput setaf 1)
green_color=$(tput setaf 2)
cyan_color=$(tput setaf 6)
default_color=$(tput setaf 9)

number_of_specs=0
number_of_specs_failed=0

error_message=''
error_message_set=1

(($# == 0)) && set -- *.suite

execute_suites "$@"
