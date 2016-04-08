. "${current_dir}/../bash-specs"

describe 'xit'

before_each() {
  create_mock __t_inc __t_print_spec_result
}

_() {
  t_xit 'skip'

  expect __t_inc to_be_called_with "$t_number_of_specs" || return
  expect __t_inc to_be_called_with "$t_number_of_skipped_specs"
}

it 'calls __inc with matching parameters' _

_() {
  t_xit 'skip'

  expect __t_print_spec_result to_be_called_with "$t_skip" 'skip' 0
}

it 'calls __print_spec_result with matching parameters' _
