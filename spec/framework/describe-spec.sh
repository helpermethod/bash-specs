cd "${BASH_SOURCE%/*}" && . ../bash-specs

describe 'describe'

_() {
  expect "$(t_describe 'bash')" to_equal $'\nbash'
}

it 'prints the name of the spec suite' _

_() {
  t_skip_specs=true
  t_describe 'bash'

  expect "$t_skip_specs" to_equal false
}

it 'sets the skip_specs flag to false' _
