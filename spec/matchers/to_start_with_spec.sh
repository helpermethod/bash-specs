require ../bash-specs

describe 'to_start_with'

_() {
  t_to_start_with 'shell' 'sh'
  expect $? to_equal 0
}

it 'passes when actual starts with expected' _

_() {
  t_to_start_with 'bash' 'sh'
  expect $? not to_equal 0
}

it 'fails when actual does not start with expected' _
