cd "${BASH_SOURCE%/*}" && . ../bash-specs

describe 'xit'

before() {
  create_mock __t_inc
  create_mock __t_print_spec_result
}

_() {
  f() {
    :
  }

  t_xit 'disabled' f

  expect __t_print_spec_result to_be_called_with "$yellow" "f" 0
}

it 'prints the description of the spec' _
