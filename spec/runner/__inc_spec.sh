. src/bash-specs

t_describe '__inc'

_() {
  local inc="$t_tmp_dir/inc"

  printf 0 > "$inc" 
  __inc "$inc"

  t_expect "$(< "$inc")" t_to_equal 1
}

t_it 'increments the number in the target file' _
