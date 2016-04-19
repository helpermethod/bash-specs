. src/bash-specs

t_describe 'to_end_with'

_() {
  to_end_with 'bash' 'sh'
  t_expect $? t_to_equal 0
}

t_it 'passes when actual ends with expected' _

_() {
  to_end_with 'shell' 'sh'
  t_expect $? not t_to_equal 0
}

t_it 'fails when actual does not end with expected' _
