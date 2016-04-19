. src/bash-specs

t_describe 'to_start_with'

_() {
  to_start_with 'shell' 'sh'
  t_expect $? t_to_equal 0
}

t_it 'passes when actual starts with expected' _

_() {
  to_start_with 'bash' 'sh'
  t_expect $? not t_to_equal 0
}

t_it 'fails when actual does not start with expected' _
