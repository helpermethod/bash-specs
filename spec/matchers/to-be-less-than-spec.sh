describe 'to_be_less_than'

_() {
  to_be_less_than 0 1
  expect "$?" to_equal 0
}

it 'passes when actual < expected' _

_() {
  to_be_less_than 1 1
  expect "$?" not to_equal 0 || return
  to_be_less_than 1 2
  expect "$?" not to_equal 0 not to_equal 0
}

it 'fails when actual >= expected' _
