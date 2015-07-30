cd "${BASH_SOURCE%/*}" && . ../bash-specs

describe 'create_mock'

f() {
  :
}  

before_each() {
  t_create_mock f
}

_() {
  f_definition=$(declare -f f)
  mock_definition=$(declare -f __t_mock)

  expect "${f_definition#*\)}" to_equal "${mock_definition#*\)}"
}

it 'replaces actual by a mock' _

_() {
  expect ${t_number_of_calls[f]} to_equal 0
  expect ${t_queue_size[f]} to_equal 0
  expect ${t_queue_front[f]} to_equal 0
  expect ${t_default_values[f]} to_equal 0
}

it 'configured the mock' _
