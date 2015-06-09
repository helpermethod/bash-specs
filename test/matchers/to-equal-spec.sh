describe 'to_equal'

_() {
  sleep 1
  if ! to_equal 'bash' 'bash'; then
    printf "Expected 'bash' to equal 'bash'" 1>&2
    return 1
  fi
}

it 'passes when actual == expected' _

_() {
  if to_equal 'bash' 'sh'; then
    printf "Expected 'bash' not to equal 'sh'" 1>&2
    return 1
  fi
}

it 'passes when actual != expected' _
