describe 'inc'

_() {
  local inc="$tmp_dir/inc"

  printf 0 > "$inc" 
  __t_inc "$inc"

  expect "$(< "$inc")" to_equal 1
}

it '' _
