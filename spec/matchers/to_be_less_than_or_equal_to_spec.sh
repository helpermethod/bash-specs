. src/bash-specs

t_describe 'to_be_less_than_or_equal_to'

_() {
  to_be_less_than_or_equal_to 0 0
  t_expect $? t_to_equal 0 || return
  to_be_less_than_or_equal_to 0 1
  t_expect $? t_to_equal 0
}

t_it 'passes when actual <= expected' _

_() {
  to_be_less_than_or_equal_to 1 0
  t_expect $? not t_to_equal 0
} 

t_it 'fails when actual > expected' _
