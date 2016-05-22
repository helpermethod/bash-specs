. src/bash-specs

t_describe 'describe'

t_before_each() {
  ls xxx
}

_() {
  t_expect "$(describe 'bash')" t_to_equal $'\nbash'
}

t_it 'prints the name of the spec suite' _

_() {
  skip_specs=true
  describe 'bash'

  t_expect "$skip_specs" t_to_equal false
}

t_it 'sets the skip_specs flag to false' _
