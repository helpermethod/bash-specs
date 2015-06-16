describe 'to_be_less_than_or_equal_to'

_() {
  to_be_less_than_or_equal_to 0 1
  expect "$?" to_equal 0 || return
  to_be_less_than_or_equal_to 1 1
  expect "$?" to_equal 0
}


it 'passes when actual <= expected'

_() {
  to_be_less_than_or_equal_to 1 2
  expect "$?" to_equal 1
} 

it 'fails when actual > expected' _
