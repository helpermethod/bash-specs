. src/bash-specs

t_describe 'to_be_called_with'

_() {
  number_of_calls[f]=1
  function_calls[f,0,0]=0
  function_calls[f,0,1]=1

  to_be_called_with f 0 1

  t_expect $? t_to_equal 0
}

t_it 'passes when the function is called with matching parameters' _

_() {
  number_of_calls[f]=1
  function_calls[f,0,0]=0
  function_calls[f,0,1]=1

  to_be_called_with f 0

  t_expect $? not t_to_equal 0
}

t_it 'fails when the function is called with too few parameters' _

_() {
  number_of_calls[f]=1
  function_calls[f,0,0]=0
  function_calls[f,0,1]=1

  to_be_called_with f 0 1 2

  t_expect $? not t_to_equal 0
}

t_it 'fails when the function is called with too many parameters' _
