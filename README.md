# bash-specs 

A modern BDD testing framework for Bash

[![Build Status](https://travis-ci.org/helpermethod/bash-specs.svg?branch=master)](https://travis-ci.org/helpermethod/bash-specs)
[![Test Coverage](https://codeclimate.com/github/helpermethod/bash-specs/badges/coverage.svg)](https://codeclimate.com/github/helpermethod/bash-specs/coverage)
[![Code Climate](https://codeclimate.com/github/helpermethod/bash-specs/badges/gpa.svg)](https://codeclimate.com/github/helpermethod/bash-specs)
[![License](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://github.com/helpermethod/bash-specs/blob/master/COPYING)

```bash
describe 'bash-specs'
    
_() {
  expect 'bash-specs' to_start_with 'bash'
}

it 'starts with bash' _
```

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
