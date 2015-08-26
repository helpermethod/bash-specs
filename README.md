# bash-specs 
[![Build Status](https://travis-ci.org/helpermethod/bash-specs.svg?branch=master)](https://travis-ci.org/helpermethod/bash-specs) [![License](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://github.com/helpermethod/bash-specs/blob/master/COPYING)

bash-specs is a BDD testing framework for Bash shell scripts. 

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
