describe 'to_be_less_than_or_equal_to'

_() {
  to_be_less_than_or_equal_to 0 0
  expect $? to_equal 0
  to_be_less_than_or_equal_to 0 1
  expect $? to_equal 0
}

it 'passes when actual <= expected' _

_() {
  to_be_less_than_or_equal_to 1 0
  expect $? not to_equal 0
} 

it 'fails when actual > expected' _
