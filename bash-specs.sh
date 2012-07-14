#/usr/bin/env bash

number_of_specs=0

describe() {
	echo "$1"
}

it() {
	before_each

	local result=$(eval "$2")

	if [[ $result ]]; then
		echo "was successful."
	else
		echo "wasn't successful."
	fi

	after_each
}

before_each() {
	:
}

after_each() {
	:
}

execute_suites() {
  local suites=${}

	for suite in "$suites"; do
		. "$suite"
	done
}

execute_suites "$@"
