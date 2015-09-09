cd "${BASH_SOURCE%/*}" && . ../bash-specs

describe '__inc'

_() {
  local inc="$tmp_dir/inc"

  printf 0 > "$inc" 
  __t_inc "$inc"

  expect "$(< "$inc")" to_equal 1
}

it "increments the target files's value" _
