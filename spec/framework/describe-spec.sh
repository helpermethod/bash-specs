cd "${BASH_SOURCE%/*}" && . ../bash-specs

describe 'describe'

_() {
  t_skip_specs=true
  t_describe 'bash' > "$tmp_dir/describe"

  expect $? to_equal 0
  expect "$(< "$tmp_dir/describe")" to_equal $'\nbash'
  expect "$t_skip_specs" to_equal false
}

it '' _
