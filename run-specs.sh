trap 'rm -rf spec/bash-specs' EXIT

cp {src,spec}/bash-specs

globals=($(sed -n -r -e 's/^(readonly )?([a-z]+(_[a-z]+)*)=.*/\2/p' \
                     -e 's/^ *?(__)?([a-z]+(_[a-z]+)*)\(.*/\2/p' \
                     -e 's/^declare -A ([a-z]+(_[a-z]+)*)/\1/p' spec/bash-specs))
(IFS='|'; sed -i -r "s/(${globals[*]})/t_\1/g" spec/bash-specs)

src/bash-specs
