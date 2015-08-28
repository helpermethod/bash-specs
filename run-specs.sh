#trap 'rm -rf spec/bash-specs' EXIT

cp {src,spec}/bash-specs

globals=($(sed -n -r -e 's/^ *readonly ([a-z]+(_[a-z]+)*)=.*/\1/p' \
                     -e 's/^([a-z]+(_[a-z]+)*)=.*/\1/p' \
                     -e 's/^ *(__)?([a-z]+(_[a-z]+)*)\(.*/\2/p' \
                     -e 's/^declare -A ([a-z]+(_[a-z]+)*)/\1/p' spec/bash-specs))
(IFS='|'; sed -i -r -e "s/\b(${globals[*]})\b/t_\1/" \
                    -e "s/(__)(${globals[*]})(\()/\1t_\2\3/" spec/bash-specs)

src/bash-specs
