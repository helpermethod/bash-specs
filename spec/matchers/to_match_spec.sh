. src/bash-specs

t_describe 'to_match'

_() {
  to_match 'shell' '^sh.*'
  t_expect $? t_to_equal 0
}

t_it 'passes when actual matches the expected string as a pattern' _

_() {
  to_match 'bash' '^sh.*'
  t_expect $? not t_to_equal 0
}

t_it 'fails when actual does not match the expected string as a pattern' _
