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

it() {
	before_each

	eval "$2"

	result=$?

	((number_of_specs++))

	if ((result > 0)); then
		local color=$red_color
		((number_of_specs_failed++))
	else
		local color=$green_color
	fi

	printf '%s  %s\n' "$color" "$1"

	after_each
}

print_version() {
	printf '%s\n' "$version"
}

print_summary() {
	((number_of_specs == 1)) && local units='spec' || local units='specs'
	((number_of_specs_failed == 0)) && local color=$green_color || local color=$red_color

	printf '\n%s%s %s, %s failed%s\n' "$color" "$number_of_specs" "$units" "$number_of_specs_failed" "$default_color"
}

execute_suites() {
	print_version

	for suite; do
		. "$suite"
	done

  print_summary
}

version=1.0.0

red_color=$(tput setaf 1)
green_color=$(tput setaf 2)
default_color=$(tput setaf 9)

number_of_specs=0
number_of_specs_failed=0

(($# == 0)) && set -- *.suite

execute_suites "$@"
