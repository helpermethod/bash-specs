main() {
  trap 'rm -rf spec/bash-specs' EXIT

  cp {src,spec}/bash-specs

  globals=($(sed -n -r -e 's/^ *readonly ([a-z]+(_[a-z]+)*)=.*/\1/p' \
    -e 's/^([a-z]+(_[a-z]+)*)=.*/\1/p' \
    -e 's/^ *(__)?([a-z]+(_[a-z]+)*)\(.*/\2/p' \
    -e 's/^declare -A ([a-z]+(_[a-z]+)*)/\1/p' spec/bash-specs))
  (IFS='|'; sed -i -r -e "s/\b(${globals[*]})\b/t_\1/g" \
    -e "s/(__)(${globals[*]})\b/\1t_\2/" spec/bash-specs)

  (($# == 0)) && set -- 'bash'

  for bash_version; do
    "$bash_version" -c 'printf "Testing against %s\n" "$BASH_VERSION"'

    "$bash_version" src/bash-specs
  done
}

main "$@"
