#/usr/bin/env bash

describe() {
	echo "$1"
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

	echo "$number_of_specs ${spec_or_specs}, $number_of_specs_failed failed"

	for spec_result in "${spec_results[@]}"; do
		:
  done
}

execute_suites() {
	for suite in "$1"; do
		. "$suite"
	done

  print_report
}

red=$(tput setaf 1)
green=$(tput setaf 2)
default=$(tput setaf 9)

specs_results=()
number_of_specs_failed=0

(($# == 0)) && set -- *.suite

execute_suites "$@"