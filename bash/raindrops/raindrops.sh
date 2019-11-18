#!/usr/bin/env sh

output=''

[ $(expr $1 % 3) = 0 ] && output=$output'Pling'
[ $(expr $1 % 5) = 0 ] && output=$output'Plang'
[ $(expr $1 % 7) = 0 ] && output=$output'Plong'
[ -z $output ] && output=$output$1

echo $output
