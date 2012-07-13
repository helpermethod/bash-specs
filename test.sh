#/usr/bin/env bash

describe() {
  echo $1
}

it() {
  echo "Running test: $1"
  before
  eval "$2"
  after
}

before() {
  echo "setup foo"
}

after() {
  echo "teardown bar"
}

describe "bla"

it 'should do something' '{
  echo "false"
  echo "not true"
}'