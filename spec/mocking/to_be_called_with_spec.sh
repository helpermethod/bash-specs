cd "${BASH_SOURCE%/*}" && . ../bash-specs

describe 'to_be_called_with'

_() {
  t_number_of_calls[f]=1
  t_function_calls[f,0,0]=0
  t_function_calls[f,0,1]=1

  t_to_be_called_with f 0 1

  expect $? to_equal 0
}

it 'passes when the function is called with matching parameters' _

_() {
  t_number_of_calls[f]=1
  t_function_calls[f,0,0]=0
  t_function_calls[f,0,1]=1

  t_to_be_called_with f 0

  expect $? not to_equal 0
}

it 'fails when the function is called with too few parameters' _

_() {
  t_number_of_calls[f]=1
  t_function_calls[f,0,0]=0
  t_function_calls[f,0,1]=1

  t_to_be_called_with f 0 1 2

  expect $? not to_equal 0
}

it 'fails when the function is called with too many parameters' _
