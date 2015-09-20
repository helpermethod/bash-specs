. "${current_dir}/../bash-specs"

describe 'xdescribe'

_() {
 expect "$(t_xdescribe 'bash')" to_equal $'\nbash'
}

it 'prints the name of the spec suite' _

_() {
  t_skip_specs=false
  t_xdescribe 'bash'

  expect "$t_skip_specs" to_equal true
}

it 'sets the skip_specs flag to true' _
