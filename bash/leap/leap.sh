#!/usr/bin/env sh

#  No input   More than one input           Input is float              Input is neither integer nor float
if [ -z "$1" ] || ! [ -z "$2" ] || ( $(echo "$1" | grep -q '\.') ) || ! [ -z $(echo "$1" | tr -d '[0-9\.]') ]; then
  echo 'Usage: leap.sh <year>'
  exit 1
fi

if [ $(expr "$1" % 4) = 0 ] && [ $(expr "$1" % 100) != 0 ] || [ $(expr "$1" % 400) = 0 ]; then
  echo 'This is a leap year.'
else
  echo 'This is not a leap year.'
fi
