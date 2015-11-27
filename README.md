# bash-specs 
[![Build Status](https://travis-ci.org/helpermethod/bash-specs.svg?branch=master)](https://travis-ci.org/helpermethod/bash-specs) [![License](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://github.com/helpermethod/bash-specs/blob/master/COPYING)

<!-- What is it? -->

bash-specs is a BDD testing framework for Bash shell scripts.

<!-- What problems does it solve? -->

While there exist a number of testing frameworks for shell scripts, most of them lack the features you are used to from other languages, like mocking, test isolation and reporting.
bash-specs brings these features to Bash testing.

<!-- How does it look like? -->

A basic 

```bash
describe 'bash-specs'
    
_() {
  expect 'bash-specs' to_start_with 'bash'
}

it 'starts with bash' _

_() {
  expect 'bash-specs' to_end_with 'specs'
}

it 'ends with specs' _
```
## Features

* test suite isolation 
* easy integration with Travis CI
* mock functions
* extensive reporting including total and per-test execution time
* a DSL resembling human-written specifications 

## Installation

## Usage

## Contribute

## Support
