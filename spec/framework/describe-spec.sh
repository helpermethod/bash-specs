cd "${BASH_SOURCE%/*}" && . ../bash-specs

describe 'describe'

_() {
  t_skip_specs=true
  local stdout=$(t_describe 'bash')

  expect "$stdout" to_equal $'\nbash'
}

it 'prints the name of the spec suite' _

_() {
  t_skip_specs=true
  t_describe 'bash'

  expect "$t_skip_specs" to_equal false
}

it 'sets the skip_specs flag to false' _
