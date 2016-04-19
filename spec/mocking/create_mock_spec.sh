. src/bash-specs

t_describe 'create_mock'

f() {
  :
}  

_() {
  create_mock f

  local f_definition=$(declare -f f)
  local mock_definition=$(declare -f __mock)

  t_expect "${f_definition#*\)}" t_to_equal "${mock_definition#*\)}" || return
  t_expect "${#mocked_functions[@]}" to_equal 1
}

t_it 'replaces the function with a mock' _

_() {
  create_mock exit

  local f_definition=$(declare -f f)
  local mock_definition=$(declare -f __mock)

  t_expect "${f_definition#*\)}" t_to_equal "${mock_definition#*\)}" || return
  t_expect "${#mocked_commands[@]}" to_equal 1
}

t_it 'replaces the command with a mock' _

_() {
  create_mock f

  t_expect ${number_of_calls[f]} t_to_equal 0 || return 
  t_expect ${queue_size[f]} t_to_equal 0 || return 
  t_expect ${queue_front[f]} t_to_equal 0 || return 
  t_expect ${default_values[f]} t_to_equal 0
}

t_it 'configures the mock' _
