. "${current_dir}/../bash-specs"

describe 'to_end_with'

_() {
  t_to_end_with 'bash' 'sh'
  expect $? to_equal 0
}

it 'passes when actual ends with expected' _

_() {
  t_to_end_with 'shell' 'sh'
  expect $? not to_equal 0
}

it 'fails when actual does not end with expected' _
