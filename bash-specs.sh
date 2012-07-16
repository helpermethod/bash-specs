#/usr/bin/env bash

describe() {
	description=$1
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

  (($? > 0)) && specs_failed

  specs_results+=($1 $result)

	after_each
}

print_report() {
	local units="specs"
	local number_of_specs=${#specs_results[@]}

	((number_of_specs == 1)) && spec_or_specs="spec"

	local color=$red_color

	((number_of_specs_failed == 0)) && color=$green_color

	echo "${color}$number_of_specs ${units}, $number_of_specs_failed failed"
	echo

	for spec_result in "${spec_results[@]}"; do
		echo "$default_color  $description"
		echo "$color    ${spec_result[1]}"
  done

  echo $default_color
}

execute_suites() {
	for suite in "$1"; do
		. "$suite"
	done

  print_report
}

red_color=$(tput setaf 1)
green_color=$(tput setaf 2)
default_color=$(tput setaf 9)

specs_results=()
number_of_specs_failed=0

(($# == 0)) && set -- *.suite

execute_suites "$@"