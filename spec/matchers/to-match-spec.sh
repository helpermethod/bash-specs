cd "${BASH_SOURCE%/*}" && . ../bash-specs

describe 'to_match'

_() {
  t_to_match 'shell' '^sh.*'
  expect $? to_equal 0
}

it 'passes when actual matches the expected string as a pattern' _

_() {
  t_to_match 'bash' '^sh.*'
  expect $? not to_equal 0
}

it 'fails when actual does not match the expected string as a pattern' _
