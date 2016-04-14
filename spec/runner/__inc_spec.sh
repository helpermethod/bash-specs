. "${current_dir}/../bash-specs"

describe '__inc'

_() {
  local inc="$tmp_dir/inc"

  printf 0 > "$inc" 
  __t_inc "$inc"

  expect "$(< "$inc")" to_equal 2
}

it 'increments the number in the target file' _
