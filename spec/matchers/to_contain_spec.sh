. src/bash-specs

t_describe 'to_contain'

_() {
  to_contain 'bashism' 'sh'
  t_expect $? t_to_equal 0
}

t_it 'passes when expected is a substring of actual' _

_() {
  to_contain 'sh' 'bash'
  t_expect $? not t_to_equal 0
}

t_it 'fails when expected is not a substring of actual' _
