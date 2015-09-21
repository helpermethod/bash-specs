. "${current_dir}/../bash-specs"

describe 'create_mock'

f() {
  :
}  

_() {
  t_create_mock f

  f_definition=$(declare -f f)
  mock_definition=$(declare -f __t_mock)

  expect "${f_definition#*\)}" to_equal "${mock_definition#*\)}" || return
  expect "${#t_original_functions[@]}" to_equal 1
}

it 'replaces the function with a mock' _

_() {
  t_create_mock exit

  f_definition=$(declare -f f)
  mock_definition=$(declare -f __t_mock)

  expect "${f_definition#*\)}" to_equal "${mock_definition#*\)}" || return
  expect "${#t_mocked_commands[@]}" to_equal 1
}

it 'replaces the command with a mock' _

_() {
  t_create_mock f

  expect ${t_number_of_calls[f]} to_equal 0 || return 
  expect ${t_queue_size[f]} to_equal 0 || return 
  expect ${t_queue_front[f]} to_equal 0 || return 
  expect ${t_default_values[f]} to_equal 0
}

it 'configures the mock' _
