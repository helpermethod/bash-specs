#trap 'rm -rf spec/bash-specs'

cp {src,spec}/bash-specs

globals=($(sed -n -r -e 's/^([a-z]+(_[a-z]+)*)=.*/\1/p' -e 's/^(__)?([a-z]+(_[a-z]+)*)\(.*/\2/p' spec/bash-specs))

(IFS='|'; sed -i -r "s/(${globals[*]})/t_\1/g" spec/bash-specs)
