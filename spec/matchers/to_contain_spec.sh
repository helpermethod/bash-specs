cd "${BASH_SOURCE%/*}" && . ../bash-specs

describe 'to_contain'

_() {
  t_to_contain 'bashism' 'sh'
  expect $? to_equal 0
}

it 'passes when expected is a substring of actual' _

_() {
  t_to_contain 'sh' 'bash'
  expect $? not to_equal 0
}

it 'fails when expected is not a substring of actual' _
