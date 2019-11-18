#!/usr/bin/env bash

# Using third-party utils, this is the easy way:
# echo $1 | rev
# rev is available on most *nix installations, so this should work
# generally.

# Alternatively, you can do it the hard way with a loop:

input=$1
output=''
for (( i = ${#input}; i >= 0; i-- )); do
  output=$output${input:i:1}
done

echo $output

# Apparently, this is a lot harder to do in plain POSIX.
