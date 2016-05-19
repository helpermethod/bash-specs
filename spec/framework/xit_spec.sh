. src/bash-specs

t_describe 'xit'

t_before_each() {
  t_create_mock __inc __print_spec_result
}

_() {
  xit 'skip'

  t_expect __inc t_to_be_called_with "$number_of_specs" || return
  t_expect __inc t_to_be_called_with "$number_of_skipped_specs"
}

t_it 'calls __inc with matching parameters' _

_() {
  xit 'skip'

  t_expect __print_spec_result t_to_be_called_with "$skip" 'skip' 0
}

t_it 'calls __print_spec_result with matching parameters' _
