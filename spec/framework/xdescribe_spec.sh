. src/bash-specs

t_describe 'xdescribe'

_() {
 t_expect "$(xdescribe 'bash')" t_to_equal $'\nbash'
}

t_it 'prints the name of the spec suite' _

_() {
  skip_specs=false
  xdescribe 'bash'

  t_expect "$skip_specs" t_to_equal true
}

t_it 'sets the skip_specs flag to true' _
