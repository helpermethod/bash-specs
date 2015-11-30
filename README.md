# bash-specs 
[![Build Status](https://travis-ci.org/helpermethod/bash-specs.svg?branch=master)](https://travis-ci.org/helpermethod/bash-specs) [![License](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://github.com/helpermethod/bash-specs/blob/master/COPYING)

bash-specs is a BDD testing framework for Bash shell scripts.
While there exist a number of testing frameworks for Bash, most of them lack the features found in other languages, like mocking or a human-readable DSL.
bash-specs brings these features to Bash testing.

Here's how a basic test (called a spec in bash-specs) look like

```bash
describe 'bash-specs'
    
# we use _ as a function name to simulate an anonymous function
_() {
  expect 'bash-specs' to_start_with 'bash'
}

it 'starts with bash' _
```

It consists of 3 building blocks:
* a `describe` statement which describes the system under tests,
* a function which declares a set of expectations
* an `it` statement which describes the expected outcome and executes the previously declared function

## Features

* test suite isolation 
  the context in which specs are run is rebuilt for every test suite
* mocking of functions, commands and builtins
  mocking allows testing of functions in isolation
* reporting
  the test runner outputs the number of run/successful/failed specs as well as total and per-spec execution time  
* human readable DSL
  a DSL which resembles human-written specifications

## Installation

<!-- How do I install bash-specs? -->

## Usage

## Contribute

## Support
