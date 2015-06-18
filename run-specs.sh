#trap 'rm -rf spec/bash-specs'

cp {src,spec}/bash-specs

globals=($(grep -E -e '^[a-z]+(_[a-z]+)*=' -e '^(__)?[a-z]+(_[a-z]+)*\(' spec/bash-specs))
# TODO replace each global occurence
