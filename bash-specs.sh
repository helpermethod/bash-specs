#/usr/bin/env bash

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

before() {
	:
}

after() {
	:
}

specs() {
	local number_of_specs=0

	if (($# > 0)); then
		specs=$@
	else
		specs=*.spec
	fi

	for spec in "$specs"; do
		. $spec
	done
}

specs "$@"