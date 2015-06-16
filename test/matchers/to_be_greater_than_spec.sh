describe 'to_be_greater_than'

_() {
  to_be_greater_than 1 0
  expect $? to_equal 0
}

it 'passes when actual > expected' _

_() {
   to_be_greater_than 0 1
   expect $? not to_equal 0 || return
   to_be_greater_than 0 0
   expect $ not to_equal 0
}

it 'fails when actual <= expected' _
