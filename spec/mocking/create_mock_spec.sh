cd "${BASH_SOURCE%/*}" && . ../bash-specs

describe 'create_mock'

_() {
  f() {
    :
  }  

  t_create_mock f

  f_definition=$(declare -f f)
  mock_definition=$(declare -f __t_mock)

  expect "${f_definition#*\)}" to_equal "${mock_definition#*\)}"
}

it '' _
